

Spaceship ship; 
Star[] stars; 
ArrayList<Asteroid> asteroids;


  public void move() {
    super.move();
    turn(rotationSpeed);
  }
}

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
    ship.turn(-20); 
  } else if (keyCode == RIGHT) { 
    ship.turn(20); 
  } else if (keyCode == UP) { 
    ship.accelerate(0.5); 
  } else if (key == ' ') { 
    ship.hyperspace(); 
  }
}

class Bullet extends Floater {
  public Bullet(Spaceship theship) {
    corners = 0;
    myCenterX = theship.getX();
    myCenterY = theship.getY();
    myXspeed = theship.getXSpeed();
    myYspeed = theship.getYSpeed();
    myPointDirection = theship.getPointDirection();
    accelerate(0.6);
  }

  public void show() {
    ellipse((float) myCenterX, (float) myCenterY, 10, 10);
  }
}
