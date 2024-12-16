class Spaceship {
    private double x, y;
    private double directionX, directionY;
    private int pointDirection;
    private final int size = 20;

    public Spaceship() {
        x = width / 2;
        y = height / 2;
        directionX = 0;
        directionY = 0;
        pointDirection = 0;
    }

    public void move() {
        x += directionX;
        y += directionY;

        // Wrap around the screen edges
        if (x > width) x = 0;
        if (x < 0) x = width;
        if (y > height) y = 0;
        if (y < 0) y = height;
    }

    public void show() {
        fill(255);
        stroke(0);
        pushMatrix();
        translate((float)x, (float)y);
        rotate(radians(pointDirection));
        beginShape();
        vertex(-size / 2, -size / 2);
        vertex(size / 2, -size / 2);
        vertex(0, size);
        endShape(CLOSE);
        popMatrix();
    }

    public void accelerate(double acceleration) {
        directionX += Math.cos(Math.toRadians(pointDirection)) * acceleration;
        directionY += Math.sin(Math.toRadians(pointDirection)) * acceleration;
    }

    public void turn(int angle) {
        pointDirection += angle;
    }

    public void hyperspace() {
        x = Math.random() * width;
        y = Math.random() * height;
        pointDirection = (int)(Math.random() * 360);
    }

    public double getX() { return x; }
    public double getY() { return y; }
    public int getPointDirection() { return pointDirection; }
}
