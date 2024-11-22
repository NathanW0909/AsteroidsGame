Spaceship ship;
Star[] stars;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  for (Star s : stars) {
    s.show();
  }
  ship.show();
  ship.move();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turnLeft();
  } else if (keyCode == RIGHT) {
    ship.turnRight();
  } else if (keyCode == UP) {
    ship.accelerate();
  } else if (key == ' ') {
    ship.hyperspace();
  }
}
