Spaceship player;
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
ArrayList<Asteroids> asteroidList = new ArrayList<Asteroids>();
int INITIAL_NUM_ASTEROIDS = 11;
int MIN_ASTEROID_SIZE = 3;
int MAX_ASTEROID_SIZE = 10;

int canvasSize = 700;

public void setup() {
  size(700, 700);
  background(0);
  noLoop();
  player = new Spaceship();
  newAsteroids();
}

public void draw() {
  background(0);
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

  controller();
  checkPlayerContact();
  checkBulletLocation();
  checkBulletContact();
}

public void keyPressed() {
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

public void keyReleased() {
  if (keyCode == UP) {
    player.setIsAccelerating(false);
  }
}

public void controller() {
  if (player.isAccelerating()) {
    player.accelerate(0.1);
  }
}

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

public void shoot() {  
  if (bulletList.size() < 5) {
    bulletList.add(new Bullet(player));
  }
}

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

public void checkBulletLocation() {
  for (int i = 0; i < bulletList.size(); i++) {
    if (bulletList.get(i).getX() > width || bulletList.get(i).getX() < 0 ||
        bulletList.get(i).getY() > height || bulletList.get(i).getY() < 0) {
      bulletList.remove(i);
      i--;
    }
  }
}

public void newAsteroids() {
  for (int i = 0; i < INITIAL_NUM_ASTEROIDS; i++) {
    int asteroidSize = (int)(Math.random() * (MAX_ASTEROID_SIZE - MIN_ASTEROID_SIZE + 1) + MIN_ASTEROID_SIZE);
    asteroidList.add(new Asteroids(asteroidSize));
  }
}
