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
