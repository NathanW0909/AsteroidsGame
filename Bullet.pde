class Bullet {
    private double x, y;
    private double directionX, directionY;

    public Bullet(Spaceship spaceship) {
        this.x = spaceship.getX();
        this.y = spaceship.getY();
        this.directionX = Math.cos(Math.toRadians(spaceship.getPointDirection())) * 5;
        this.directionY = Math.sin(Math.toRadians(spaceship.getPointDirection())) * 5;
    }

    public void move() {
        x += directionX;
        y += directionY;
    }

    public void show() {
        fill(255, 0, 0);
        ellipse((float)x, (float)y, 5, 5);
    }

    public double getX() { return x; }
    public double getY() { return y; }
}
