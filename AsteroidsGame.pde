Spaceship ship;
Star[] stars;

void setup() {
    size(800, 800); // Set canvas size
    ship = new Spaceship(); // Initialize spaceship
    stars = new Star[100]; // Create an array of stars
    for (int i = 0; i < stars.length; i++) {
        stars[i] = new Star(); // Initialize each star
    }
}

void draw() {
    background(0); // Black background
    for (Star star : stars) {
        star.show(); // Draw stars
    }
    ship.move(); // Move spaceship
    ship.show(); // Draw spaceship
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == LEFT) {
            ship.turn(-5); // Turn left
        } else if (keyCode == RIGHT) {
            ship.turn(5); // Turn right
        } else if (keyCode == UP) {
            ship.accelerate(0.1); // Accelerate forward
        }
    } else if (key == 'h' || key == 'H') {
        ship.hyperspace(); // Activate hyperspace
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

