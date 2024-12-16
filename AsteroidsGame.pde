SpaceShip falcon;
Star [] destroyers;
Planet [] galaxy;
ArrayList <Asteroids> field = new ArrayList<Asteroids>();
Asteroids [] rocks;
public void setup() 
{
  size(700,600);
  smooth();
  falcon = new SpaceShip();
  destroyers = new Star[201];
  for(int i=0; i<destroyers.length; i++)
  {
    destroyers[i] = new Star();
  }
  galaxy = new Planet[20];
  for(int i=0; i<galaxy.length; i++)
  {
    galaxy[i] = new Planet();
  }
  for(int a=0; a<(int)(Math.random()*10)+10; a++)
  {
    field.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);
  for(int i=0; i<destroyers.length; i++)
  {
    destroyers[i].show();
  }
  for(int i=0; i<galaxy.length; i++)
  {
    galaxy[i].show();
  }
  /*if(keyPressed == true)
  {
    falcon.rockets();
  }*/
  falcon.move();
  falcon.show();
  for(int a=0; a<field.size(); a++)
  {
    field.get(a).move();
    field.get(a).show();
    if(dist(falcon.getX(),falcon.getY(),field.get(a).getX(),field.get(a).getY()) < 40)
    {
      field.remove(a);
    }
  }
}
class SpaceShip extends Floater
{   
  SpaceShip()
  {
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
    myColor = color(128,128,128);
    myCenterX = 350;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  /*public void rockets()
  {
    noFill();
    stroke(255);
    strokeWeight(4);
    arc((float)myCenterX,(float)myCenterY,40,40,PI-PI/6+(float)myPointDirection,PI+PI/6+(float)myPointDirection);
    strokeWeight(1);
  }*/
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
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
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

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  } 
} 
class Star
{
  protected int starX, starY, starColor;
  Star()
  {
    starX = ((int)(Math.random()*701));
    starY = ((int)(Math.random()*601));
    starColor = color(255,255,255);
    //starColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  public void show()
  {
    noStroke();
    fill(starColor);
    ellipse(starX,starY,2,2);
  }
}
class Planet extends Star
{
  Planet()
  {
    starX = ((int)(Math.random()*701));
    starY = ((int)(Math.random()*601));
    starColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  public void show()
  {
    noStroke();
    fill(starColor);
    ellipse(starX,starY,20,20);
  }
}
public void keyPressed()
{
  if(key == 'a')
  {
    falcon.rotate(-10);
  }
  if(key == 'd')
  {
    falcon.rotate(10);
  }
  if(key == 'w') //accelerates up
  {
    falcon.accelerate(.30);
  }
  if(key == 's') //accelerate down
  {
    falcon.accelerate(-.30);
  }
  if(keyCode == ENTER)
  {
    falcon.setX((int)(Math.random()*701));
    falcon.setY((int)(Math.random()*601));
    falcon.setDirectionX(0);
    falcon.setDirectionY(0);
    falcon.setPointDirection((int)(Math.random()*361));
  }
}  
class Asteroids extends Floater
{
  private int rockType;
  private int rotSpeed;
  private int factor;
  Asteroids()
  {
    rockType = ((int)(Math.random()*2));
    factor = 2;
    noStroke();
    if(rockType == 0)
    {
      corners = 19;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 1*factor;
      yCorners[0] = 10*factor;
      xCorners[1] = 2*factor;
      yCorners[1] = 12*factor;
      xCorners[2] = 6*factor;
      yCorners[2] = 8*factor;
      xCorners[3] = 7*factor;
      yCorners[3] = 6*factor;
      xCorners[4] = 10*factor;
      yCorners[4] = 4*factor;
      xCorners[5] = 13*factor;
      yCorners[5] = -1*factor;
      xCorners[6] = 14*factor;
      yCorners[6] = -5*factor;
      xCorners[7] = 10*factor;
      yCorners[7] = -12*factor;
      xCorners[8] = 5*factor;
      yCorners[8] = -12*factor;
      xCorners[9] = 2*factor;
      yCorners[9] = -15*factor;
      xCorners[10] = -4*factor;
      yCorners[10] = -13*factor;
      xCorners[11] = -9*factor;
      yCorners[11] = -14*factor;
      xCorners[12] = -13*factor;
      yCorners[12] = -12*factor;
      xCorners[13] = -15*factor;
      yCorners[13] = -6*factor;
      xCorners[14] = -14*factor;
      yCorners[14] = -1*factor;
      xCorners[15] = -12*factor;
      yCorners[15] = 2*factor;
      xCorners[16] = -13*factor;
      yCorners[16] = 5*factor;
      xCorners[17] = -7*factor;
      yCorners[17] = 11*factor;
      xCorners[18] = -3*factor;
      yCorners[18] = 8*factor;
      myColor = color(160,82,45);
      myCenterX = (int)(Math.random()*701);
      myCenterY = (int)(Math.random()*601);
      rotSpeed = (int)((Math.random()*7)-3);
    }
    else if(rockType == 1)
    {
      corners = 14;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 3*factor;
      yCorners[0] = 8*factor;
      xCorners[1] = 6*factor;
      yCorners[1] = 4*factor;
      xCorners[2] = 10*factor;
      yCorners[2] = 1*factor;
      xCorners[3] = 10*factor;
      yCorners[3] = -3*factor;
      xCorners[4] = 8*factor;
      yCorners[4] = -9*factor;
      xCorners[5] = 4*factor;
      yCorners[5] = -10*factor;
      xCorners[6] = 0*factor;
      yCorners[6] = -12*factor;
      xCorners[7] = -5*factor;
      yCorners[7] = -10*factor;
      xCorners[8] = -9*factor;
      yCorners[8] = -6*factor;
      xCorners[9] = -11*factor;
      yCorners[9] = -1*factor;
      xCorners[10] = -9*factor;
      yCorners[10] = 1*factor;
      xCorners[11] = -11*factor;
      yCorners[11] = 4*factor;
      xCorners[12] = -7*factor;
      yCorners[12] = 8*factor;
      xCorners[13] = -3*factor;
      yCorners[13] = 10*factor;
      myColor = color(112,138,144);
      myCenterX = (int)(Math.random()*701);
      myCenterY = (int)(Math.random()*601);
      rotSpeed = (int)((Math.random()*7)-3);
    }
  }
  public void move()
  {
    rotate(rotSpeed);
    super.move();
    myCenterX += Math.cos(rotSpeed);
    myCenterY += Math.sin(rotSpeed);
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
