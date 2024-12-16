// Main setup and drawing functions
SpaceShip falcon;
Star [] destroyers;
Planet [] galaxy;
ArrayList<Asteroids> field = new ArrayList<Asteroids>();
Asteroids [] rocks;

public void setup() {
  size(700, 600);
  smooth();
  falcon = new SpaceShip();
  destroyers = new Star[201];
  for (int i = 0; i < destroyers.length; i++) {
    destroyers[i] = new Star();
  }
  galaxy = new Planet[20];
  for (int i = 0; i < galaxy.length; i++) {
    galaxy[i] = new Planet();
  }
  for (int a = 0; a < (int)(Math.random() * 10) + 10; a++) {
    field.add(new Asteroids());
  }
}

public void draw() {
  background(0);
  
  // Show stars
  for (int i = 0; i < destroyers.length; i++) {
    destroyers[i].show();
  }
  
  // Show planets
  for (int i = 0; i < galaxy.length; i++) {
    galaxy[i].show();
  }
  
  // Move and show spaceship
  falcon.move();
  falcon.show();
  
  // Handle asteroid movements
  for (int a = 0; a < field.size(); a++) {
    Asteroids asteroid = field.get(a);
    asteroid.move();
    asteroid.show();
    
    // Collision detection with spaceship
    if (dist(falcon.getX(), falcon.getY(), asteroid.getX(), asteroid.getY()) < 40) {
      field.remove(a);
    }
  }
}

// SpaceShip class
class SpaceShip extends Floater {
  SpaceShip() {
    corners = 22;
    xCorners = new int[corners];
    yCorners = new int[corners];
    // Initialize spaceship shape coordinates
    // Add other setup code as necessary
  }

  // Movement and display methods for spaceship
  public void move() {
    super.move();
  }

  public void show() {
    super.show();
  }
}

// Asteroids class
class Asteroids extends Floater {
  private int rockType;
  private int rotSpeed;
  private int factor;

  Asteroids() {
    rockType = (int)(Math.random() * 2);
    factor = 2;
    // Initialize asteroid shape
    // Add other setup code as necessary
  }

  // Movement and display methods for asteroids
  public void move() {
    rotate(rotSpeed);
    super.move();
  }

  public void show() {
    super.show();
  }
}

// Star class
class Star {
  protected int starX, starY, starColor;

  Star() {
    starX = (int)(Math.random() * 701);
    starY = (int)(Math.random() * 601);
    starColor = color(255, 255, 255);
  }

  public void show() {
    noStroke();
    fill(starColor);
    ellipse(starX, starY, 2, 2);
  }
}

// Planet class inherits from Star
class Planet extends Star {
  Planet() {
    starX = (int)(Math.random() * 701);
    starY = (int)(Math.random() * 601);
    starColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }

  public void show() {
    noStroke();
    fill(starColor);
    ellipse(starX, starY, 20, 20);
  }
}

// Key press handling
public void keyPressed() {
  if (key == 'a') {
    falcon.rotate(-10);
  }
  if (key == 'd') {
    falcon.rotate(10);
  }
  if (key == 'w') {
    falcon.accelerate(0.30);
  }
  if (key == 's') {
    falcon.accelerate(-0.30);
  }
  if (keyCode == ENTER) {
    falcon.setX((int)(Math.random() * 701));
    falcon.setY((int)(Math.random() * 601));
    falcon.setDirectionX(0);
    falcon.setDirectionY(0);
    falcon.setPointDirection((int)(Math.random() * 361));
  }
}

// Floater class (abstract class for moving objects)
abstract class Floater {
  protected int corners;
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY;
  protected double myDirectionX, myDirectionY;
  protected double myPointDirection;

  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  public void accelerate(double dAmount) {
    double dRadians = myPointDirection * (Math.PI / 180);
    myDirectionX += (dAmount) * Math.cos(dRadians);
    myDirectionY += (dAmount) * Math.sin(dRadians);
  }

  public void rotate(int nDegreesOfRotation) {
    myPointDirection += nDegreesOfRotation;
  }

  public void move() {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    if (myCenterX > width) {
      myCenterX = 0;
    } else if (myCenterX < 0) {
      myCenterX = width;
    }
    if (myCenterY > height) {
      myCenterY = 0;
    } else if (myCenterY < 0) {
      myCenterY = height;
    }
  }

  public void show() {
    fill(myColor);
    stroke(myColor);
    double dRadians = myPointDirection * (Math.PI / 180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for (int nI = 0; nI < corners; nI++) {
      xRotatedTranslated = (int)((xCorners[nI] * Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians)) + myCenterX);
      yRotatedTranslated = (int)((xCorners[nI] * Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians)) + myCenterY);
      vertex(xRotatedTranslated, yRotatedTranslated);
    }
    endShape(CLOSE);
  }
}
