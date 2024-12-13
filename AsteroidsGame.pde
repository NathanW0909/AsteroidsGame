

Spaceship ship; 
Star[] stars; 
ArrayList<Asteroid> asteroids;

class Asteroid extends Floater {
  private double rotationSpeed;

  public Asteroid() {
    corners = 6;
    xCorners = new int[]{-10, -7, 7, 10, 7, -7};
    yCorners = new int[]{7, 10, 10, -7, -10, -7};
    myColor = color(150, 150, 150);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;
    myPointDirection = Math.random() * 360;
    rotationSpeed = Math.random() * 2 - 1;
  }

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
