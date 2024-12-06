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
  
  // Show stars
  for (Star s : stars) {
    s.show();
  }
  

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.move();
    a.show();
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
}

class Laser {
  double x, y, xSpeed, ySpeed, direction;

  Laser(Spaceship s) {
    x = s.myCenterX;
    y = s.myCenterY;
    direction = s.myPointDirection;

    double rad = Math.toRadians(direction);
    xSpeed = 8 * Math.cos(rad);
    ySpeed = 8 * Math.sin(rad);
  }

  public void move() {
    x += xSpeed;
    y += ySpeed;
  }

  public void show() {
    stroke(255, 0, 0);
    strokeWeight(3);
    point((float)x, (float)y);
  }

  public boolean isOffScreen() {
    return x < 0 || x > width || y < 0 || y > height;
  }
}

class Asteroid {
  private double x, y, xSpeed, ySpeed, direction;
  private int size;

  Asteroid() {
    x = Math.random() * width;
    y = Math.random() * height;
    xSpeed = Math.random() * 2 - 1;
    ySpeed = Math.random() * 2 - 1;
    direction = Math.random() * 360;
    size = 30 + (int)(Math.random() * 30);
  }

  public void move() {
    x += xSpeed;
    y += ySpeed;
    if (x > width) x = 0;
    else if (x < 0) x = width;
    if (y > height) y = 0;
    else if (y < 0) y = height;
  }

  public void show() {
    stroke(255);
    noFill();
    ellipse((float)x, (float)y, size, size);
  }

  public boolean isHit(Laser l) {
    return dist((float)x, (float)y, (float)l.x, (float)l.y) < size / 2;
  }
}

