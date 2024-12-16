public class Asteroids {
  private float x, y;
  private int size;

  // Constructor
  public Asteroids(int size) {
    this.size = size;
    x = Math.random() * 700;
    y = Math.random() * 700;
  }

  // Move the asteroid
  public void move() {
    x += Math.random() * 2 - 1;
    y += Math.random()
