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
