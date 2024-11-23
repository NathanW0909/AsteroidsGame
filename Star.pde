class Star {
  private int x, y, starColor;

  Star() {
    x = (int) (Math.random() * width);
    y = (int) (Math.random() * height);
    starColor = color(255);
  }

  public void show() {
    stroke(starColor);
    point(x, y);
  }
}
