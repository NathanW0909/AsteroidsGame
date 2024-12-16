public class Bullet {
  private float x, y, directionX, directionY;

  // Constructor
  public Bullet(Spaceship player) {
    x = player.getX();
    y = player.getY();
    directionX = Math.cos(Math.toRadians(player.getPointDirection())) * 5;
    directionY = Math.sin(Math.toRadians(player.getPointDirection())) * 5;
  }

  // Move the bullet
  public void move() {
    x += directionX;
    y += directionY;
  }

  // Show the bullet
  public void show() {
    fill(255);
    ellipse(x, y, 5, 5);
  }

  // Getters
  public float getX() { return x; }
  public float getY() { return y; }
}

