Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;

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
    float distance = dist((float)a.getCenterX(), (float)a.getCenterY(), (float)ship.getCenterX(), (float)ship.getCenterY());
    if (distance < 20) {
      asteroids.remove(i);
      ship.reset();
      break;
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
  } else if (keyCode == ALT) {
    ship.hyperspace();
  }
}

class Spaceship extends Floater {
  public Spaceship() {
    corners = 3;
    xCorners = new int[]{-10, 10, 0};
    yCorners = new int[]{10, 10, -15};
    myColor = color(255);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myPointDirection = Math.random() * 360;
    myXspeed = 0;
    myYspeed = 0;
  }

  public void reset() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myPointDirection = Math.random() * 360;
    myXspeed = 0;
    myYspeed = 0;
  }

  public void show() {
    super.show();
  }

  public void move() {
    super.move();
  }

  public void turn(float angle) {
    myPointDirection += angle;
  }

  public void accelerate(float amount) {
    myXspeed += Math.cos(Math.toRadians(myPointDirection)) * amount;
    myYspeed += Math.sin(Math.toRadians(myPointDirection)) * amount;
  }

  public void hyperspace() {
    reset();
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
    myXspeed = Math.random() * 4 - 2;
    myYspeed = Math.random() * 4 - 2;
    myPointDirection = Math.random() * 360;
    rotationSpeed = Math.random() * 4 - 2;
  }

  public void move() {
    super.move();
    turn(rotationSpeed);
  }

  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}
