public class Spaceship {
  private float myCenterX, myCenterY;
  private float myDirectionX, myDirectionY;
  private float myPointDirection;
  private boolean isAccelerating = false;

  // Constructor
  public Spaceship() {
    myCenterX = 350;
    myCenterY = 350;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }

  // Move the spaceship
  public void move() {
    if (isAccelerating) {
      myDirectionX += Math.cos(Math.toRadians(myPointDirection)) * 0.1;
      myDirectionY += Math.sin(Math.toRadians(myPointDirection)) * 0.1;
    }

    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }

  // Show the spaceship
  public void show() {
    pushMatrix();
    translate(myCenterX, myCenterY);
    rotate(radians(myPointDirection));
    fill(255);
    triangle(-10, -10, 20, 0, -10, 10);
    popMatrix();
  }

  // Accelerate the spaceship
  public void accelerate(float acceleration) {
    isAccelerating = true;
  }

  // Turn the spaceship
  public void turn(float angle) {
    myPointDirection += angle;
  }

  public void setIsAccelerating(boolean value) {
    isAccelerating = value;
  }

  // Setters and getters
  public void setX(int x) { myCenterX = x; }
  public void setY(int y) { myCenterY = y; }
  public void setDirectionX(float x) { myDirectionX = x; }
  public void setDirectionY(float y) { myDirectionY = y; }
  public void setPointDirection(float direction) { myPointDirection = direction; }
  public float getX() { return myCenterX; }
  public float getY() { return myCenterY; }
  public float getPointDirection() { return myPointDirection; }
}
