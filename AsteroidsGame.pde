Spaceship ship;
Star[] stars;
Asteroid[] asteroids;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  asteroids = new Asteroid[5];
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid();
  }
}

void draw() {
  background(0);
  for (Star s : stars) {
    s.show();
  }
  for (Asteroid a : asteroids) {
    a.move();
    a.show();
  }
  ship.move();
  ship.show();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-5);
  } else if (keyCode == RIGHT) {
    ship.turn(5);
  } else if (keyCode == UP) {
    ship.accelerate(0.1);
  } else if (key == ' ') {
    ship.hyperspace();
  }
}
