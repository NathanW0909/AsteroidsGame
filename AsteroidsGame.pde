// Main file

SpaceShip spaceship;
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Star[] stars;
Planet[] planets;

public void setup() {
  size(700,600);
  smooth();
  spaceship = new SpaceShip();
  stars = new Star[201];
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  planets = new Planet[20];
  for(int i = 0; i < planets.length; i++) {
    planets[i] = new Planet();
  }
  for(int a = 0; a < 10; a++) {
    asteroids.add(new Asteroids());
  }
}

public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  for(int i = 0; i < planets.length; i++) {
    planets[i].show();
  }
  spaceship.move();
  spaceship.show();
  for(int a = 0; a < asteroids.size(); a++) {
    asteroids.get(a).move();
    asteroids.get(a).show();
    if(dist(spaceship.getX(), spaceship.getY(), asteroids.get(a).getX(), asteroids.get(a).getY()) < 40) {
      asteroids.remove(a);
    }
  }
  for(int b = 0; b < bullets.size(); b++) {
    bullets.get(b).move();
    bullets.get(b).show();
  }
}

public void keyPressed() {
  if (key == 'a') {
    spaceship.rotate(-10);
  }
  if (key == 'd') {
    spaceship.rotate(10);
  }
  if (key == 'w') { 
    spaceship.accelerate(0.30);
  }
  if (key == 's') { 
    spaceship.accelerate(-0.30);
  }
  if (key == ' ') {
    spaceship.setX((int)(Math.random() * 701));
    spaceship.setY((int)(Math.random() * 601));
    spaceship.setDirectionX(0);
    spaceship.setDirectionY(0);
    spaceship.setPointDirection((int)(Math.random() * 361));
  }
  if (key == SHIFT) {
    bullets.add(new Bullet(spaceship.getX(), spaceship.getY(), spaceship.getPointDirection()));
  }
}

// SpaceShip class

class SpaceShip extends Floater {
  SpaceShip() {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    xCorners[0] = 0;
    yCorners[0] = -10;
    xCorners[1] = -5;
    yCorners[1] = 5;
    xCorners[2] = -3;
    yCorners[2] = 8;
    xCorners[3] = 3;
    yCorners[3] = 8;
    xCorners[4] = 5;
    yCorners[4] = 5;
    xCorners[5] = 0;
    yCorners[5] = -10;
    
    myColor = color(128, 128, 255);
    myCenterX = 350;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  
  public void setX(int x) { myCenterX = x; } 
  public int getX() { return (int)myCenterX; }   
  public void setY(int y) { myCenterY = y; } 
  public int getY() { return (int)myCenterY; }   
  public void setDirectionX(double x) { myDirectionX = x; }   
  public double getDirectionX() { return myDirectionX; }
  public void setDirectionY(double y) { myDirectionY = y; }
  public double getDirectionY() { return myDirectionY; }
  public void setPointDirection(int degrees) { myPointDirection = degrees; }
  public double getPointDirection() { return myPointDirection; }
}

// Bullet class

class Bullet {
  float x, y, angle;
  float speed = 5;
  
  Bullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }
  
  public void move() {
    x += cos(radians(angle)) * speed;
    y += sin(radians(angle)) * speed;
  }
  
  public void show() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 5, 5);
  }
}

// Asteroids class

class Asteroids extends Floater {
  private int rotSpeed;
  private int factor;
  
  Asteroids() {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    rotSpeed = (int)(Math.random() * 6) - 3;
    factor = (int)(Math.random() * 20) + 20;
    
    xCorners[0] = 0;
    yCorners[0] = -12;
    xCorners[1] = -8;
    yCorners[1] = -8;
    xCorners[2] = -10;
    yCorners[2] = -6;
    xCorners[3] = -12;
    yCorners[3] = -2;
    xCorners[4] = -9;
    yCorners[4] = 4;
    xCorners[5] = -5;
    yCorners[5] = 6;
    xCorners[6] = 2;
    yCorners[6] = 5;
    xCorners[7] = 7;
    yCorners[7] = 0;
    
    myColor = color(255, 255, 255);
    myCenterX = (int)(Math.random() * 701);
    myCenterY = (int)(Math.random() * 601);
    myDirectionX = (Math.random() * 4) - 2;
    myDirectionY = (Math.random() * 4) - 2;
    myPointDirection = (int)(Math.random() * 361);
  }
  
  public void show() {
    fill(myColor);
    stroke(255);
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
  
  public void move() {
    myPointDirection += rotSpeed;
    super.move();
  }
}

// Star class

class Star {
  protected int starX, starY, starColor;
  
  Star() {
    starX = ((int)(Math.random() * 701));
    starY = ((int)(Math.random() * 601));
    starColor = color(255, 255, 255);
  }
  
  public void show() {
    noStroke();
    fill(starColor);
    ellipse(starX, starY, 2, 2);
  }
}

// Planet class

class Planet extends Star {
  Planet() {
    starX = ((int)(Math.random() * 701));
    starY = ((int)(Math.random() * 601));
    starColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
  
  public void show() {
    noStroke();
    fill(starColor);
    ellipse(starX, starY, 20, 20);
  }
}

// Floater class

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
  abstract public double getDirection
