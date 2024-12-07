class Star {
  private float x, y;
  
  public Star() {
    x = random(width);
    y = random(height);
  }

  public void show() {
    stroke(255);
    point(x, y);
  }
}
