SpaceShip spaceship;
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Star[] stars;
Planet[] planets;

public void setup() {
  size(700,600);
  smooth();
  spaceship = new SpaceShip();
  stars = new Star[201];
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  planets = new Planet[20];
  for(int i = 0; i < planets.length; i++) {
    planets[i] = new Planet();
  }
  for(int a = 0; a < 10; a++) {
    asteroids.add(new Asteroids());
  }
}

public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  for(int i = 0; i < planets.length; i++) {
    planets[i].show();
  }
  spaceship.move();
  spaceship.show();
  for(int a = 0; a < asteroids.size(); a++) {
    asteroids.get(a).move();
    asteroids.get(a).show();
    if(dist(spaceship.getX(), spaceship.getY(), asteroids.get(a).getX(), asteroids.get(a).getY()) < 40) {
      asteroids.remove(a);
    }
  }
  for(int b = 0; b < bullets.size(); b++) {
    bullets.get(b).move();
    bullets.get(b).show();
  }
}

public void keyPressed() {
  if (key == 'a') {
    spaceship.rotate(-10);
  }
  if (key == 'd') {
    spaceship.rotate(10);
  }
  if (key == 'w') { 
    spaceship.accelerate(0.30);
  }
  if (key == 's') { 
    spaceship.accelerate(-0.30);
  }
  if (key == ' ') {
    spaceship.setX((int)(Math.random() * 701));
    spaceship.setY((int)(Math.random() * 601));
    spaceship.setDirectionX(0);
    spaceship.setDirectionY(0);
    spaceship.setPointDirection((int)(Math.random() * 361));
  }
  if (key == SHIFT) {
    bullets.add(new Bullet(spaceship.getX(), spaceship.getY(), spaceship.getPointDirection()));
  }
}
