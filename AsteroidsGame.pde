class Asteroid {
    private double x, y, xSpeed, ySpeed, rotation, size;

    Asteroid() {
        x = Math.random() * width;
        y = Math.random() * height;
        xSpeed = Math.random() * 2 - 1;
        ySpeed = Math.random() * 2 - 1;
        rotation = Math.random() * 360;
        size = Math.random() * 50 + 40;  // Asteroids now have a larger size
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
        stroke(255);  // White color for asteroids
        noFill();
        ellipse((float) x, (float) y, (float) size, (float) size);  // Larger asteroid display
    }

    public boolean hit(double laserX, double laserY) {
        return dist((float) x, (float) y, (float) laserX, (float) laserY) < size / 2;
    }
}

class Laser {
    private double x, y, direction, speed;

    Laser(double startX, double startY, double startDirection) {
        x = startX;
        y = startY;
        direction = startDirection;
        speed = 8;  // Increased speed of laser for more action
    }

    public void move() {
        double radians = direction * Math.PI / 180;
        x += speed * Math.cos(radians);
        y += speed * Math.sin(radians);
    }

    public void show() {
        stroke(255, 0, 0);  // Red laser color
        strokeWeight(4);  // Make the laser thicker for visibility
        point((float) x, (float) y);  // Draw laser as a point
    }

    public boolean offScreen() {
        return x < 0 || x > width || y < 0 || y > height;
    }

    public boolean hits(Asteroid asteroid) {
        return asteroid.hit(x, y);
    }
}

Spaceship ship;
ArrayList<Asteroid> asteroids;

void setup() {
    size(800, 800);  // Larger window size
    ship = new Spaceship();
    asteroids = new ArrayList<>();
    for (int i = 0; i < 5; i++) {  // Start with fewer asteroids for clarity
        asteroids.add(new Asteroid());
    }
}

void draw() {
    background(0);  // Black background for space

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
            asteroids.remove(i);  // Destroy asteroid on collision
        }
    }

    // Respawn asteroids if none are left
    if (asteroids.isEmpty()) {
        for (int i = 0; i < 5; i++) {
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
            ship.accelerate(0.5);
        }
    } else if (key == ' ') {
        ship.fireLaser();
    } else if (keyCode == ALT) {
        ship.hyperspace();
    }
}
