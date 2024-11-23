class Spaceship extends Floater {
  Spaceship() {
    corners = 3;
    xCorners = new int[]{-8, 16, -8};
    yCorners = new int[]{-8, 0, 8};
    myColor = color(255);
    myCenterX = width / 2;
    myCenterY = height / 2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random() * 360;
  }

