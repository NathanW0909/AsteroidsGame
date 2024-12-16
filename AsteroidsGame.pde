//constants and declaration relating to player
Spaceship player;
ArrayList <Bullet> bulletList = new ArrayList<Bullet>();
ArrayList <Asteroids> asteroidList = new ArrayList<Asteroids>();
int INITIAL_NUM_ASTEROIDS = 11;
int MIN_ASTEROID_SIZE = 3;
int MAX_ASTEROID_SIZE = 10;

boolean isStart = true; // Start screen
int canvasSize = 700;   // Canvas size

public void setup() {
  size(700, 700);
  background(0);
  
  noLoop();
  
  player = new Spaceship();
  
  newAsteroids();
}

public void draw() {
  background(0);
  
  // Move and show player
  player.move();
  player.show();
  
  for (int i = 0; i < bulletList.size(); i++) {
    bulletList.get(i).show();
    bulletList.get(i).move();
  }

  for (int i = 0; i < asteroidList.size(); i++) {
    asteroidList.get(i).show();
    asteroidList.get(i).move();
  }

  // Handle controls
  controller();
  
  // Handle collisions
  checkPlayerContact();
  checkBulletLocation();
  checkBulletContact();
  
  if (isStart) {
    startScreen();
  }
  
  if (player.getHealth() == 0) {
    loseScreen();
  }
  
  if (score == 1000) {
    winGame();
  }
}

// Handle button presses
public void keyPressed() {
  if (key == 'w') {
    player.setIsAccelerating(true);
  }
  
  if (key == 'd') { player.turn(5); }
  if (key == 'a') { player.turn(-5); }

  if (key == 'q') { hyperspace(); }
  if (key == 'e') { brake(); }
  
  if (key == 'o') { shoot(); }
  
  if (key == 's' && isStart == true) {
    isStart = false;
    loop();
  }
}

// Reset booleans controlled by keys when released
public void keyReleased() {
  if (key == 'w') {
    player.setIsAccelerating(false);
  }
}

// Moves player depending on boolean
public void controller() {
  if (player.isAccelerating()) {
    player.accelerate(0.1);
  }
}

// Stops player movement, changes stars, and resets player position
public void hyperspace() {
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

// Set speed to 0
public void brake() {
  player.setDirectionX(0);
  player.setDirectionY(0);
}

// Shoots bullets
public void shoot() {  
  if (bulletList.size() < 5) {
    bulletList.add(new Bullet(player));
  }
}

// Function that erases asteroids on player collision
public void checkPlayerContact() {
  for (int i = 0; i < asteroidList.size(); i++) {
    float space = dist(player.getX(), player.getY(), asteroidList.get(i).getX(), asteroidList.get(i).getY());
    int sizeI = asteroidList.get(i).getSize() * 10;
    
    if (space <= sizeI) {
      asteroidList.remove(i);
      player.setHealth(player.getHealth() - 1);
    }
  }
}

// Function to check bullet-asteroid collision
public void checkBulletContact() {
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

// Function to check if bullets are out of bounds
public void checkBulletLocation() {
  for (int i = 0; i < bulletList.size(); i++) {
    if (bulletList.get(i).getX() > width || bulletList.get(i).getX() < 0 ||
        bulletList.get(i).getY() > height || bulletList.get(i).getY() < 0) {
      bulletList.remove(i);
      i--;
    }
  }
}

// Creates new asteroids
public void newAsteroids() {
  for (int i = 0; i < INITIAL_NUM_ASTEROIDS; i++) {
    int asteroidSize = (int)(Math.random() * (MAX_ASTEROID_SIZE - MIN_ASTEROID_SIZE + 1) + MIN_ASTEROID_SIZE);
    asteroidList.add(new Asteroids(asteroidSize));
  }
}

// Clears all asteroids
public void clearAsteroids() {
  asteroidList.clear();
}

// Clears all bullets
public void clearBullets() {
  bulletList.clear();
}

// Displays start screen
public void startScreen() {
  background(0);
  
  fill(0, 0, 255);
  textSize(64);
  text("Blue Star", 210, 200);
  
  fill(255);
  textSize(32);
  text("W to Move", 270, 250);
  text("A + D to Turn", 245, 290);
  text("Q to Hyperspace", 220, 330);
  text("E to Brake", 270, 370);
  text("O to Shoot", 265, 410);
  text("S to Start", 270, 550);
}

// Displays lose screen
public void loseScreen() {
  noLoop();
  background(0);
  fill(255, 0, 0);
  textSize(64);
  text("You Lose", 220, 250);
}

// Displays win screen
public void winGame() {
  noLoop();
  background(0);
  fill(0, 0, 255);
  textSize(64);
  text("You Win!", 220, 250);
}
