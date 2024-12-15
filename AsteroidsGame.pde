ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  bullets = new ArrayList<Bullet>();
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);
  ship.move();
  ship.show();

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.move();
    a.show();

    if (dist((float) ship.getX(), (float) ship.getY(), (float) a.getX(), (float) a.getY()) < 20) {
      asteroids.remove(i);
      break;
    }

    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      if (dist((float) b.getX(), (float) b.getY(), (float) a.getX(), (float) a.getY()) < 20) {
        bullets.remove(j);
        asteroids.remove(i);
        if (a.getSize() > 10) {
          asteroids.add(new Asteroid(a.getX(), a.getY(), a.getSize() / 2));
          asteroids.add(new Asteroid(a.getX(), a.getY(), a.getSize() / 2));
        }
        break;
      }
    }
  }

  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.move();
    b.show();

    if (b.getX() < 0 || b.getX() > width || b.getY() < 0 || b.getY() > height) {
      bullets.remove(i);
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-20);
  } else if (keyCode == RIGHT) {
    ship.turn(20);
  } else if (keyCode == UP) {
    ship.accelerate(0.5);
  } else if (key == ' ') {
    ship.hyperspace();
  } else if (keyCode == SHIFT) {
    bullets.add(new Bullet(ship));
  }
}
