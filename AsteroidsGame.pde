SpaceShip yeah = new SpaceShip();
Star[] whoa = new Star[200]; 
Stalker yikes = new Stalker();

ArrayList <Asteroid> hazard = new ArrayList <Asteroid>();
ArrayList <Bullet> bang = new ArrayList <Bullet>();

boolean shoot = false;
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;

int lives = 3;
int score = 0;

public void setup() 
{
  size(500,500);
  for(int i = 0;i<whoa.length;i++)
  {
    whoa[i] = new Star();
  }
  for(int i = 0;i<15;i++)
  {
    hazard.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for(int i = 0;i<whoa.length;i++)
  {
    whoa[i].show();
  }
  yeah.show();
  yeah.move();
  for(int i = 0;i<hazard.size();i++)
  {
     hazard.get(i).show();
     hazard.get(i).move();
     if(dist(yeah.getX(),yeah.getY(),hazard.get(i).getX(),hazard.get(i).getY())<30)
     {
       lives--;
       score++;
       hazard.remove(i);
     }
  }
  for(int i = 0; i<bang.size(); i++)
  {
    bang.get(i).show();
    bang.get(i).move();
  }
  for(int i = 0; i<bang.size(); i++)
  {
    for(int g = 0; g<hazard.size(); g++)
    {
      if(dist(bang.get(i).getX(),bang.get(i).getY(),hazard.get(g).getX(),hazard.get(g).getY())<30)
      {
        bang.remove(i);
        hazard.remove(g);
        score++;
        break;
      }
    }
  }
  if(dist(yikes.getX(),yikes.getY(),yeah.getX(),yeah.getY())<20)
  {
    lives--;
    yikes.setX(250);
    yikes.setY(520);
  }
  yikes.show();
  yikes.move();

  fill(255);
  textSize(40);
  text("Lives: "+lives,10,45);
  text("Score: "+score,10,85);
  if(score==15)
  {
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("YOU WIN!",250,250);
  }
  if(lives<=0)
  {
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER",250,250);  
  }
}
public void keyPressed()
{
  if(key==' ' && frameCount%4==0){shoot = true;}
  if(shoot==true && frameCount%5==0){bang.add(new Bullet(yeah));}
  if(key=='w'){up = true;}
  if(key=='s'){down = true;}
  if(key=='a'){left = true;}
  if(key=='d'){right = true;}
  if(key=='e'){
    yeah.setX((int)(Math.random()*501)); 
    yeah.setY((int)(Math.random()*501));
    yeah.setDirectionX(0);
    yeah.setDirectionY(0);
    yeah.setPointDirection((int)(Math.random()*360));}
  if(up==true){yeah.accelerate(0.25);}
  if(down==true){yeah.accelerate(-0.25);}
  if(left==true){yeah.setPointDirection((int)yeah.myPointDirection-15);}
  if(right==true){yeah.setPointDirection((int)yeah.myPointDirection+15);}
}
public void keyReleased()
{
  if(key==' '){bang.add(new Bullet(yeah));}
  if(key=='w'){up = false;}
  if(key=='s'){down = false;}
  if(key=='a'){left = false;}
  if(key=='d'){right = false;}
}
class Star
{
    private int myX; int myY;
    public Star() 
    {
      myX = (int)(Math.random()*500);
      myY = (int)(Math.random()*500);
    }
    public void show()
    {
      fill(255);
      stroke(255);
      ellipse(myX,myY,2,2);
    }
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
