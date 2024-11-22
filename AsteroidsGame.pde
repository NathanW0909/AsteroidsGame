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
