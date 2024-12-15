class Asteroid extends Floater {
  private int size;

  public Asteroid() {
    size = (int) random(30, 60);
    myCenterX = random(width);
    myCenterY = random(height);
    myXspeed = random(-2, 2);
    myYspeed = random(-2, 2);
    myPointDirection = random(360);
  }

  public Asteroid(double x, double y, int newSize) {
    size = newSize;
    myCenterX = x;
    myCenterY = y;
    myXspeed = random(-2, 2);
    myYspeed = random(-2, 2);
    myPointDirection = random(360);
  }

  public void show() {
    fill(150);
    ellipse((float) myCenterX, (float) myCenterY, size, size);
  }

  public int getSize() {
    return size;
  }
}
