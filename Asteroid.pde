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
