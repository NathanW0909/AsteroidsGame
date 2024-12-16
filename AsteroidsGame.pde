// Constants and variables
Spaceship player;
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
ArrayList<Asteroids> asteroidList = new ArrayList<Asteroids>();
Star[] stars;
int canvasSize = 700;
int numAsteroids = 11;
int MIN_ASTEROID_SIZE = 3;
int MAX_ASTEROID_SIZE = 10;
int NUM_STARS = 500;

// Setup the game
void setup() {
  size(700, 700);
  background(0);
  noLoop();
  
  player = new Spaceship();
  stars = new Star[NUM_STARS];
  
  newStars();
  newAsteroids();
}

// Main game loop
void draw() {
  background(0);
  
  // Draw and move stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }

  // Draw player spaceship
  player.move();
  player.show();
  
  // Draw bullets
  for (int i = 0; i < bulletList.size(); i++) {
    bulletList.get(i).show();
    bulletList.get(i).move();
  }

  // Draw asteroids
  for (int i = 0; i < asteroidList.size(); i++) {
    asteroidList.get(i).show();
    asteroidList.get(i).move();
  }

  // Handle player controls and collisions
  controller();
  checkPlayerContact();
  checkBulletLocation();
  checkBulletContact();
}

// Handle key pressed events
void keyPressed() {
  if (keyCode == UP) { 
    player.accelerate(0.1); 
  }
  if (keyCode == RIGHT) { 
    player.turn(5); 
  }
  if (keyCode == LEFT) { 
    player.turn(-5); 
  }
  if (key == SHIFT) { 
    hyperspace(); 
  }
  if (key == ' ') { 
    shoot(); 
  }
}

// Handle key released events
void keyReleased() {
  if (keyCode == UP) {
    player.setIsAccelerating(false);
  }
}

// Move and control the spaceship
void controller() {
  if (player.isAccelerating()) {
    player.accelerate(0.1);
  }
}

// Teleport the player to a random location (hyperspace)
void hyperspace() {
  clearBullets();
  clearAsteroids();
  newAsteroids();
  
  player.setX((int)(Math.random() * canvasSize));
  player.setY((int)(Math.random() * canvasSize));
  player.setDirectionX(0);
  player.setDirectionY(0);
  player.setPointDirection((int)(Math.random() * 360));
  newStars();
}

// Shoot a bullet
void shoot() {  
  if (bulletList.size() < 5) {
    bulletList.add(new Bullet(player));
  }
}

// Check if the player collides with an asteroid
void checkPlayerContact() {
  for (int i = 0; i < asteroidList.size(); i++) {
    float space = dist(player.getX(), player.getY(), asteroidList.get(i).getX(), asteroidList.get(i).getY());
    int sizeI = asteroidList.get(i).getSize() * 10;
    if (space <= sizeI) {
      asteroidList.remove(i);
      player.setHealth(player.getHealth() - 1);
    }
  }
}

// Check if bullets hit asteroids
void checkBulletContact() {
  if (bulletList.size() > 0 && asteroidList.size() > 0) {
    for (int i = 0; i < bulletList.size(); i++) {
      for (int j = 0; j < asteroidList.size(); j++) {
        Bullet currentB = bulletList.get(i);
        Asteroids currentA = asteroidList.get(j);
        float d = dist(currentB.getX(), currentB.getY(), currentA.getX(), currentA.getY()); 
        int sizeI = currentA.getSize() * 10;
        if (d <= sizeI) {
          bulletList.remove(i);
          asteroidList.remove(j);
          break;
        }
      }
    }
  }
}

// Check if bullets go off the screen
void checkBulletLocation() {
  for (int i = 0; i < bulletList.size(); i++) {
    if (bulletList.get(i).getX() > width || bulletList.get(i).getX() < 0 ||
        bulletList.get(i).getY() > height || bulletList.get(i).getY() < 0) {
      bulletList.remove(i);
      i--;
    }
  }
}

// Create new stars
void newStars() {
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(canvasSize);
  }
}

// Create new asteroids
void newAsteroids() {
  for (int i = 0; i < numAsteroids; i++) {
    int asteroidSize = (int)(Math.random() * (MAX_ASTEROID_SIZE - MIN_ASTEROID_SIZE + 1) + MIN_ASTEROID_SIZE);
    asteroidList.add(new Asteroids(asteroidSize));
  }
}

// Clear all asteroids
void clearAsteroids() {
  asteroidList.clear();
}

// Clear all bullets
void clearBullets() {
  bulletList.clear();
}

// Star class for creating stars in the background
class Star {
  float x, y;

  Star(int canvasSize) {
    x = random(canvasSize);
    y = random(canvasSize);
  }

  void show() {
    stroke(255);
    point(x, y);
  }
}

// Spaceship class for the player's spaceship
class Spaceship {
  float myCenterX, myCenterY;
  float myDirectionX, myDirectionY;
  float myPointDirection;
  boolean isAccelerating = false;

  Spaceship() {
    myCenterX = canvasSize / 2;
    myCenterY = canvasSize / 2;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }

  void move() {
    if (isAccelerating) {
      myDirectionX += cos(radians(myPointDirection)) * 0.1;
      myDirectionY += sin(radians(myPointDirection)) * 0.1;
    }
    
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }

  void show() {
    pushMatrix();
    translate(myCenterX, myCenterY);
    rotate(radians(myPointDirection));
    fill(255);
    triangle(-10, -10, 20, 0, -10, 10);  // Simple triangle spaceship
    popMatrix();
  }

  void accelerate(float acceleration) {
    isAccelerating = true;
  }

  void turn(float angle) {
    myPointDirection += angle;
  }

  void setIsAccelerating(boolean value) {
    isAccelerating = value;
  }

  void setX(int x) { myCenterX = x; }
  void setY(int y) { myCenterY = y; }
  void setDirectionX(float x) { myDirectionX = x; }
  void setDirectionY(float y) { myDirectionY = y; }
  void setPointDirection(float direction) { myPointDirection = direction; }
  float getX() { return myCenterX; }
  float getY() { return myCenterY; }
  float getPointDirection() { return myPointDirection; }
}

// Bullet class for the player's bullets
class Bullet {
  float x, y, directionX, directionY;

  Bullet(Spaceship player) {
    x = player.getX();
    y = player.getY();
    directionX = cos(radians(player.getPointDirection())) * 5;
    directionY = sin(radians(player.getPointDirection())) * 5;
  }

  void move() {
    x += directionX;
    y += directionY;
  }

  void show() {
    fill(255);
    ellipse(x, y, 5, 5);
  }

  float getX() { return x; }
  float getY() { return y; }
}

// Asteroid class for asteroids in the game
class Asteroids {
  float x, y;
  int size;

  Asteroids(int size) {
    this.size = size;
    x = random(canvasSize);
    y = random(canvasSize);
  }

  void move() {
    // Asteroids moving randomly (can add more logic here)
    x += random(-1, 1);
    y += random(-1, 1);
  }

  void show() {
    fill(150);
    ellipse(x, y, size * 10, size * 10);
  }

  int getSize() { return size; }
  float getX() { return x; }
  float getY() { return y; }
}
