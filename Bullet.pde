ArrayList<Laser> lasers;

void keyPressed() {
  if (key == ' ') {
    lasers.add(new Laser(ship));
  }
}

class Laser extends Floater {
  public Laser(Spaceship ship) {
    myCenterX = ship.getCenterX();
    myCenterY = ship.getCenterY();
    myPointDirection = ship.getPointDirection();
    myXspeed = 5 * Math.cos(Math.toRadians(myPointDirection));
    myYspeed = 5 * Math.sin(Math.toRadians(myPointDirection));
  }

  public void move() {
    super.move();
  }

  public float getX() {
    return (float) myCenterX;
  }

  public float getY() {
    return (float) myCenterY;
  }

  public boolean isOffScreen() {
    return myCenterX < 0 || myCenterX > width || myCenterY < 0 || myCenterY > height;
  }

  public void show() {
    fill(255);
    ellipse((float) myCenterX, (float) myCenterY, 5, 5);
  }
}
