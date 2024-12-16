class Asteroid extends Floater
{
  private int rotSpeed;
  Asteroid()
  {
    corners = 6;
    int[] xS = {(int)(Math.random()*25)+5, (int)(Math.random()*25)+5, (int)(Math.random()*25)-30, (int)(Math.random()*25)-30, (int)(Math.random()*25)-30, (int)(Math.random()*25)+5};
    int[] yS = {0, (int)(Math.random()*25)-30, (int)(Math.random()*25)-30, 0, (int)(Math.random()*25)+5, (int)(Math.random()*25)+5};
    xCorners = xS;
    yCorners = yS;
    myColor = color(200);
    myCenterX = (int)(Math.random()*500); 
    myCenterY = (int)(Math.random()*500);
    myDirectionX = Math.random()*5-3; 
    myDirectionY = Math.random()*-5+3;
    myPointDirection = 270;
    rotSpeed = (int)(Math.random()*6)-3;
    if(rotSpeed == 0)
    {
      rotSpeed = (int)(Math.random()*3)+1;
    }
  }
  public void move()
  {
    myPointDirection = myPointDirection + rotSpeed;
    super.move();
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}
