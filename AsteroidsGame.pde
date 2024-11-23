Spaceship ship;
Star[] stars;
Asteroid[] asteroids;
ArrayList<Laser> lasers;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  asteroids = new Asteroid[5];
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid();
  }
  lasers = new ArrayList<Laser>();
}

void draw() {
  background(0);
  
  // Draw stars
  for (Star s : stars) {
    s.show();
  }
  
  // Draw asteroids
  for (Asteroid a : asteroids) {
    a.move();
    a.show();
  }
  
  // Draw and move lasers
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser l = lasers.get(i);
    l.move();
    l.show();
    if (l.isOffScreen()) {
      lasers.remove(i);
    }
  }
  
  // Draw and move spaceship
  ship.move();
  ship.show();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-15); // Increased turning speed
  } else if (keyCode == RIGHT) {
    ship.turn(15); // Increased turning speed
  } else if (keyCode == UP) {
    ship.accelerate(0.3); // Increased acceleration
  } else if (key == ' ') {
    lasers.add(new Laser(ship)); // Shoot laser
  } else if (keyCode == ALT) { // Hyperspace with Alt key
    ship.hyperspace();
  }
}

class Laser {
  private double x, y; // Current position
  private double xSpeed, ySpeed; // Speed of the laser
  private double direction; // Direction in degrees

  Laser(Spaceship ship) {
    direction = ship.getPointDirection();
    x = ship.getCenterX();
    y = ship.getCenterY();

    // Calculate speed based on direction
    double radians = direction * (Math.PI / 180);
    xSpeed = 5 * Math.cos(radians);
    ySpeed = 5 * Math.sin(radians);
  }

  public void move() {
    x += xSpeed;
    y += ySpeed;
  }

  public void show() {
    stroke(255);
    strokeWeight(2);
    point((float) x, (float) y);
  }

  public boolean isOffScreen() {
    return x < 0 || x > width || y < 0 || y > height;
  }
}
