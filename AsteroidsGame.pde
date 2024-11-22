Spaceship ship;
ArrayList<Asteroid> asteroids;

void setup() {
    size(800, 800);
    ship = new Spaceship();
    asteroids = new ArrayList<>();
    for (int i = 0; i < 10; i++) {
        asteroids.add(new Asteroid());
    }
}

void draw() {
    background(0);

    // Show and move asteroids
    for (int i = asteroids.size() - 1; i >= 0; i--) {
        Asteroid asteroid = asteroids.get(i);
        asteroid.move();
        asteroid.show();
    }

    // Show and move spaceship
    ship.move();
    ship.show();
    ship.updateLasers();

    // Check for collisions between lasers and asteroids
    for (int i = asteroids.size() - 1; i >= 0; i--) {
        if (ship.checkLaserCollision(asteroids.get(i))) {
            asteroids.remove(i); // Destroy asteroid
        }
    }

    // Respawn asteroids if none are left
    if (asteroids.isEmpty()) {
        for (int i = 0; i < 10; i++) {
            asteroids.add(new Asteroid());
        }
    }
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == LEFT) {
            ship.turn(-5);
        } else if (keyCode == RIGHT) {
            ship.turn(5);
        } else if (keyCode == UP) {
            ship.accelerate(0.2);
        }
    } else if (key == ' ') {
        ship.fireLaser();
    } else if (keyCode == ALT) {
        ship.hyperspace();
    }
}
