class Bullet {
    private double x, y;
    private double directionX, directionY;

    public Bullet(Spaceship spaceship) {
        x = spaceship.getX();
        y = spaceship.getY();
        directionX = Math.cos(Math.toRadians(spaceship.getPointDirection())) * 5;
        directionY = Math.sin(Math.toRadians(spaceship.getPointDirection())) * 5;
    }

    public void move() {
        x += directionX;
        y += directionY;
    }

    public void show() {
        fill(255, 0, 0);
        noStroke();
        ellipse((float)x, (float)y, 5, 5);
    }

    public boolean isOffScreen() {
        return (x < 0 || x > width || y < 0 || y > height);
    }
}
