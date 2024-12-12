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

    // Check collision with ship
    if (dist((float)a.getCenterX(), (float)a.getCenterY(), (float)ship.getCenterX(), (float)ship.getCenterY()) < 20) {
      asteroids.remove(i);
      // Handle ship collision logic if necessary
      continue;
    }

    // Check collision with lasers
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
    ship.hyperspace();
  } else if (keyCode == SHIFT) {
    lasers.add(new Laser(ship));
  }
}

class Asteroid extends Floater {
  private double rotationSpeed;

  public Asteroid() {
    corners = 6;
    xCorners = new int[]{-10, -7, 7, 10, 7, -7};
    yCorners = new int[]{7, 10, 10, -7, -10, -7};
    myColor = color(150, 150, 150);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;
    myPointDirection = Math.random() * 360;
    rotationSpeed = Math.random() * 2 - 1;
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

class Laser {
  private double x, y, speed, angle;

  public Laser(Spaceship ship) {
    x = ship.getCenterX();
    y = ship.getCenterY();
    angle = ship.getPointDirection();
    speed = 5;
  }

  public void move() {
    x += speed * Math.cos(Math.toRadians(angle));
    y += speed * Math.sin(Math.toRadians(angle));
  }

  public void show() {
    fill(255, 0, 0);
    noStroke();
    ellipse((float)x, (float)y, 5, 5);
  }

  public boolean isOffScreen() {
    return x < 0 || x > width || y < 0 || y > height;
  }

  public double getX() {
    return x;
  }

  public double getY() {
    return y;
  }
}
