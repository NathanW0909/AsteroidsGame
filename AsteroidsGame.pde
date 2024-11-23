Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
  lasers = new ArrayList<Laser>();
}

void draw() {
  background(0);
  for (Star s : stars) {
    s.show();
  }
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.move();
    a.show();
    for (int j = lasers.size() - 1; j >= 0; j--) {
      Laser l = lasers.get(j);
      if (a.isHit(l)) {
        asteroids.remove(i);
        lasers.remove(j);
        break;
      }
    }
  }
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser l = lasers.get(i);
    l.move();
    l.show();
    if (l.isOffScreen()) {
      lasers.remove(i);
    }
  }
  ship.move();
  ship.show();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-15);
  } else if (keyCode == RIGHT) {
    ship.turn(15);
  } else if (keyCode == UP) {
    ship.accelerate(0.3);
  } else if (key == ' ') {
    lasers.add(new Laser(ship));
  } else if (keyCode == ALT) {
    ship.hyperspace();
  }
}
