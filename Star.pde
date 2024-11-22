class Star {
  private float x, y;

  Star() {
    x = (float) (Math.random() * width);
    y = (float) (Math.random() * height);
  }

  public void show() {
    fill(255);
    noStroke();
    ellipse(x, y, 2, 2);
  }
}
