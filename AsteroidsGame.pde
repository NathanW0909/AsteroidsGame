Spaceship ship;
Star[] stars;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  for (Star s : stars) {
    s.show();
  }
  ship.show();
  ship.move();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turnLeft();
  } else if (keyCode == RIGHT) {
    ship.turnRight();
  } else if (keyCode == UP) {
    ship.accelerate();
  } else if (key == ' ') {
    ship.hyperspace();
  }
}



class Asteroid {
  private int corners;
  private int[] xCorners, yCorners;
  private double myCenterX, myCenterY;
  private double myXspeed, myYspeed;
  private double myPointDirection;
  private int myColor;

  Asteroid() {
    corners = 6;
    xCorners = new int[]{-20, -10, 10, 20, 10, -10};
    yCorners = new int[]{0, -20, -20, 0, 20, 20};
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 2 - 1; // Random speed between -1 and 1
    myYspeed = Math.random() * 2 - 1;
    myPointDirection = Math.random() * 360;
    myColor = color(150, 150, 150); // Gray color
  }

  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }

  public void show() {
    fill(myColor);
    stroke(myColor);
    pushMatrix();
    translate((float) myCenterX, (float) myCenterY);
    float dRadians = (float) (myPointDirection * (Math.PI / 180));
    rotate(dRadians);
    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);
    popMatrix();
  }
}

