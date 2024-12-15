Spaceship ship;
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullets;
Star[] stars;

void setup() {
    size(800, 600);
    ship = new Spaceship();
    asteroids = new ArrayList<Asteroid>();
    bullets = new ArrayList<Bullet>();
    stars = new Star[100];
    for (int i = 0; i < stars.length; i++) stars[i] = new Star();
    for (int i = 0; i < 5; i++) asteroids.add(new Asteroid());
}

void draw() {
    background(0);
    for (Star star : stars) star.show();
    for (Asteroid asteroid : asteroids) {
        asteroid.move();
        asteroid.show();
    }
    for (int i = bullets.size() - 1; i >= 0; i--) {
        Bullet bullet = bullets.get(i);
        bullet.move();
        bullet.show();
        if (bullet.myCenterX < 0 || bullet.myCenterX > width || bullet.myCenterY < 0 || bullet.myCenterY > height) {
            bullets.remove(i);
        }
    }
    ship.move();
    ship.show();
}

void keyPressed() {
    if (keyCode == LEFT) ship.turn(-15);
    if (keyCode == RIGHT) ship.turn(15);
    if (keyCode == UP) ship.accelerate(0.5);
    if (key == ' ') bullets.add(new Bullet(ship));
    if (key == 'h') ship.hyperspace();
}

