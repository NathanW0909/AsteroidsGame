class Bullet {
  float x, y, angle;
  float speed = 5;
  
  Bullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }
  
  public void move() {
    x += cos(radians(angle)) * speed;
    y += sin(radians(angle)) * speed;
  }
  
  public void show() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 5, 5);
  }
}

