class Spaceship {
  private int corners;
  private int[] xCorners, yCorners;
  private int myColor;
  private double myCenterX, myCenterY;
  private double myXspeed, myYspeed;
  private double myPointDirection;

  Spaceship() {
    corners = 3;
    xCorners = new int[]{-10, 20, -10};
    yCorners = new int[]{-10, 0, 10};
    myColor = color(255); // White color
    myCenterX = width / 2.0;
    myCenterY = height / 2.0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void accelerate(double dAmount) {
    double dRadians = myPointDirection * (Math.PI / 180);
    myXspeed += dAmount * Math.cos(dRadians);
    myYspeed += dAmount * Math.sin(dRadians);
  }

  public void turn(double degreesOfRotation) {
    myPointDirection += degreesOfRotation;
  }

  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    // Screen wrapping
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

  public void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = 0;
    myYspeed = 0;
  }
}
