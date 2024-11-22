Spaceship ship;
ArrayList<Asteroid> asteroids;

void setup() {
    size(800, 800);  // Set a larger window for better visibility
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

class Asteroid {
    private double x, y, xSpeed, ySpeed, rotation, size;

    Asteroid() {
        x = Math.random() * width;
        y = Math.random() * height;
        xSpeed = Math.random() * 2 - 1;
        ySpeed = Math.random() * 2 - 1;
        rotation = Math.random() * 360;
        size = Math.random() * 40 + 40;  // Larger asteroids
    }

    public void move() {
        x += xSpeed;
        y += ySpeed;

        if (x > width) x = 0;
        else if (x < 0) x = width;
        if (y > height) y = 0;
        else if (y < 0) y = height;
    }

    public void show() {
        stroke(255);
        noFill();
        ellipse((float) x, (float) y, (float) size, (float) size);  // Draw asteroid as a circle
    }

    public boolean hit(double laserX, double laserY) {
        return dist((float) x, (float) y, (float) laserX, (float) laserY) < size / 2;
    }
}
