SpaceShip spaceship;
Star[] stars;
Planet[] planets;
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>();
Asteroids[] rocks;

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
  for(int a = 0; a < (int)(Math.random() * 10) + 10; a++) {
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
}

class SpaceShip extends Floater {   
  SpaceShip() {
    corners = 22;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = -12;
    xCorners[1] = -4;
    yCorners[1] = -12;
    xCorners[2] = -8;
    yCorners[2] = -10;
    xCorners[3] = -10;
    yCorners[3] = -8;
    xCorners[4] = -13;
    yCorners[4] = -2;
    xCorners[5] = -13;
    yCorners[5] = 2;
    xCorners[6] = -10;
    yCorners[6] = 8;
    xCorners[7] = -8;
    yCorners[7] = 10;
    xCorners[8] = -4;
    yCorners[8] = 12;
    xCorners[9] = 0;
    yCorners[9] = 12;
    xCorners[10] = 2;
    yCorners[10] = 14;
    xCorners[11] = 5;
    yCorners[11] = 14;
    xCorners[12] = 7;
    yCorners[12] = 13;
    xCorners[13] = 7;
    yCorners[13] = 11;
    xCorners[14] = 5;
    yCorners[14] = 10;
    xCorners[15] = 4;
    yCorners[15] = 10;
    xCorners[16] = 14;
    yCorners[16] = 5;
    xCorners[17] = 14;
    yCorners[17] = 2;
    xCorners[18] = 4;
    yCorners[18] = 2;
    xCorners[19] = 4;
    yCorners[19] = -2;
    xCorners[20] = 14;
    yCorners[20] = -2;
    xCorners[21] = 14;
    yCorners[21] = -5;
    myColor = color(128, 128, 128);
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
  if (keyCode == ENTER) {
    spaceship.setX((int)(Math.random() * 701));
    spaceship.setY((int)(Math.random() * 601));
    spaceship.setDirectionX(0);
    spaceship.setDirectionY(0);
    spaceship.setPointDirection((int)(Math.random() * 361));
  }
  if (key == ' ') {
    spaceship.setX((int)(Math.random() * 701));
    spaceship.setY((int)(Math.random() * 601));
    spaceship.setDirectionX(0);
    spaceship.setDirectionY(0);
    spaceship.setPointDirection((int)(Math.random() * 361));
  }
}

class Asteroids extends Floater {
  private int rockType;
  private int rotSpeed;
  private int factor;
  
  Asteroids() {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    rockType = (int)(Math.random() * 2);
    rotSpeed = (int)(Math.random() * 6) - 3;
    factor = (int)(Math.random() * 10) + 5;
    
    xCorners[0] = 0;
    yCorners[0] = -10;
    xCorners[1] = -8;
    yCorners[1] = -8;
    xCorners[2] = -10;
    yCorners[2] = -6;
    xCorners[3] = -12;
    yCorners[3] = -2;
    xCorners[4] = -9;
    yCorners[4] = 3;
    xCorners[5] = -6;
    yCorners[5] = 6;
    xCorners[6] = -2;
    yCorners[6] = 4;
    xCorners[7] = 0;
    yCorners[7] = 6;
    xCorners[8] = 4;
    yCorners[8] = 3;
    xCorners[9] = 7;
    yCorners[9] = 0;
    xCorners[10] = 5;
    yCorners[10] = -6;
    xCorners[11] = 0;
    yCorners[11] = -8;
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
