Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
  lasers = new ArrayList<Laser>();
}

void draw() {
  background(0);
  
  for (Star s : stars) {
    s.show();
  }

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.move();
    a.show();
    if (dist((float)a.getCenterX(), (float)a.getCenterY(), (float)ship.getCenterX(), (float)ship.getCenterY()) < 20) {
      asteroids.remove(i);
      continue;
    }
    for (int j = lasers.size() - 1; j >= 0; j--) {
      Laser l = lasers.get(j);
      if (a.isHit(l)) {
        asteroids.remove(i);
        lasers.remove(j);
        break;
      }
    }
  }

  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser l = lasers.get(i);
    l.move();
    l.show();
    if (l.isOffScreen()) {
      lasers.remove(i);
    }
  }
  
  ship.move();
  ship.show();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-20);
  } else if (keyCode == RIGHT) {
    ship.turn(20);
  } else if (keyCode == UP) {
    ship.accelerate(0.5);
  } else if (key == ' ') {
    lasers.add(new Laser(ship));
  } else if (keyCode == ALT) {
    ship.hyperspace();
  }
}class Asteroid extends Floater {
  private double rotationSpeed;

  public Asteroid() {
    corners = 6;
    xCorners = new int[]{-10, -7, 7, 10, 7, -7};
    yCorners = new int[]{7, 10, 10, -7, -10, -7};
    myColor = color(150, 150, 150);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 4 - 2;
    myYspeed = Math.random() * 4 - 2;
    myPointDirection = Math.random() * 360;
    rotationSpeed = Math.random() * 4 - 2;
  }

  public void move() {
    super.move();
    turn(rotationSpeed);
  }

  public boolean isHit(Laser l) {
    return dist((float)myCenterX, (float)myCenterY, (float)l.getX(), (float)l.getY()) < 15;
  }

  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}



