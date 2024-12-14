class Bullet extends Floater {  
  public Bullet(Spaceship ship) {  
    corners = 0;  
    myCenterX = ship.getX();  
    myCenterY = ship.getY();  
    myXspeed = ship.getXSpeed() + 2 * Math.cos(Math.toRadians(ship.getPointDirection()));  
    myYspeed = ship.getYSpeed() + 2 * Math.sin(Math.toRadians(ship.getPointDirection()));  
    myPointDirection = ship.getPointDirection();  
  }  

  public void show() {  
    fill(255, 0, 0);  
    ellipse((float) myCenterX, (float) myCenterY, 5, 5);  
  }  
}  
