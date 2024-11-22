Spaceship ship;
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers;

void setup() {
    size(800, 800);
    ship = new Spaceship();
    asteroids = new ArrayList<>();
    for (int i = 0; i < 10; i++) {
        asteroids.add(new Asteroid());
    }
    lasers = new ArrayList<>();
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

    // Show and move lasers
    for (int i = lasers.size() - 1; i >= 0; i--) {
        Laser laser = lasers.get(i);
        laser.move();
        laser.show();

        // Check for collisions with asteroids
        for (int j = asteroids.size() - 1; j >= 0; j--) {
            if (laser.hits(asteroids.get(j))) {
                asteroids.remove(j); // Destroy asteroid
                lasers.remove(i);   // Remove laser
                break;
            }
        }

        // Remove laser if it goes off screen
        if (laser.offScreen()) {
            lasers.remove(i);
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
        lasers.add(new Laser(ship.getX(), ship.getY(), ship.getDirection()));
    } else if (keyCode == ALT) {
        ship.hyperspace();
    }
}

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

class Asteroid {
    private double x, y, xSpeed, ySpeed, rotation, size;

    Asteroid() {
        x = Math.random() * width;
        y = Math.random() * height;
        xSpeed = Math.random() * 2 - 1;
        ySpeed = Math.random() * 2 - 1;
        rotation = Math.random() * 360;
        size = Math.random() * 40 + 20; // Varying size between 20 and 60
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
        ellipse((float) x, (float) y, (float) size, (float) size);
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
        speed = 10;
    }

    public void move() {
        double radians = direction * Math.PI / 180;
        x += speed * Math.cos(radians);
        y += speed * Math.sin(radians);
    }

    public void show() {
        stroke(255, 0, 0);
        strokeWeight(2);
        point((float) x, (float) y);
    }

    public boolean offScreen() {
        return x < 0 || x > width || y < 0 || y > height;
    }

    public boolean hits(Asteroid asteroid) {
        return asteroid.hit(x, y);
    }
}
