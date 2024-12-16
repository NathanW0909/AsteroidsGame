Spaceship player;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean shiftIsPressed = false;
boolean spaceIsPressed = false;

int canvasSize = 700;

public void setup() {
    size(canvasSize, canvasSize);
    player = new Spaceship();
    for (int i = 0; i < 5; i++) {
        asteroids.add(new Asteroid((int)(Math.random() * 3) + 3));
    }
}

public void draw() {
    background(0);
    
    // Show asteroids
    for (Asteroid asteroid : asteroids) {
        asteroid.move();
        asteroid.show();
    }

    // Show and move bullets
    for (int i = 0; i < bullets.size(); i++) {
        Bullet bullet = bullets.get(i);
        bullet.move();
        bullet.show();
        if (bullet.getX() > width || bullet.getY() > height || bullet.getX() < 0 || bullet.getY() < 0) {
            bullets.remove(i);
            i--;
        }
    }

    // Move and show spaceship
    if (wIsPressed) { player.accelerate(0.1); }
    if (aIsPressed) { player.turn(-5); }
    if (dIsPressed) { player.turn(5); }
    player.move();
    player.show();
}

public void keyPressed() {
    if (key == 'w') { wIsPressed = true; }
    if (key == 'a') { aIsPressed = true; }
    if (key == 'd') { dIsPressed = true; }
    if (key == ' ') { spaceIsPressed = true; }
    if (key == SHIFT) { shiftIsPressed = true; }
    
    if (shiftIsPressed) {
        player.hyperspace();
    }

    if (spaceIsPressed) {
        bullets.add(new Bullet(player));
    }
}

public void keyReleased() {
    if (key == 'w') { wIsPressed = false; }
    if (key == 'a') { aIsPressed = false; }
    if (key == 'd') { dIsPressed = false; }
    if (key == ' ') { spaceIsPressed = false; }
    if (key == SHIFT) { shiftIsPressed = false; }
}
