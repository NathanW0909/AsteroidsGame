import java.util.ArrayList;

public class Game {
  // Constants and variables
  private static Spaceship player;
  private static ArrayList<Bullet> bulletList = new ArrayList<>();
  private static ArrayList<Asteroids> asteroidList = new ArrayList<>();
  private static Star[] stars;
  private static final int canvasSize = 700;
  private static final int numAsteroids = 11;
  private static final int NUM_STARS = 500;

  // Setup the game
  public static void setup() {
    size(700, 700);
    background(0);
    player = new Spaceship();
    stars = new Star[NUM_STARS];
    
    newStars();
    newAsteroids();
  }

  // Main game loop
  public static void draw() {
    background(0);
    
    // Draw and move stars
    for (int i = 0; i < stars.length; i++) {
      stars[i].show();
    }

    // Draw player spaceship
    player.move();
    player.show();
    
    // Draw bullets
    for (int i = 0; i < bulletList.size(); i++) {
      bulletList.get(i).show();
      bulletList.get(i).move();
    }

    // Draw asteroids
    for (int i = 0; i < asteroidList.size(); i++) {
      asteroidList.get(i).show();
      asteroidList.get(i).move();
    }

    // Handle player controls and collisions
    controller();
    checkPlayerContact();
    checkBulletLocation();
    checkBulletContact();
  }

  // Handle key pressed events
  public static void keyPressed() {
    if (keyCode == UP) { 
      player.accelerate(0.1); 
    }
    if (keyCode == RIGHT) { 
      player.turn(5); 
    }
    if (keyCode == LEFT) { 
      player.turn(-5); 
    }
    if (key == SHIFT) { 
      hyperspace(); 
    }
    if (key == ' ') { 
      shoot(); 
    }
  }

  // Handle key released events
  public static void keyReleased() {
    if (keyCode == UP) {
      player.setIsAccelerating(false);
    }
  }

  // Move and control the spaceship
  public static void controller() {
    if (player.isAccelerating()) {
      player.accelerate(0.1);
    }
  }

  // Teleport the player to a random location (hyperspace)
  public static void hyperspace() {
    clearBullets();
    clearAsteroids();
    newAsteroids();
    
    player.setX((int)(Math.random() * canvasSize));
    player.setY((int)(Math.random() * canvasSize));
    player.setDirectionX(0);
    player.setDirectionY(0);
    player.setPointDirection((int)(Math.random() * 360));
    newStars();
  }

  // Shoot a bullet
  public static void shoot() {  
    if (bulletList.size() < 5) {
      bulletList.add(new Bullet(player));
    }
  }

  // Check if the player collides with an asteroid
  public static void checkPlayerContact() {
    for (int i = 0; i < asteroidList.size(); i++) {
      float space = dist(player.getX(), player.getY(), asteroidList.get(i).getX(), asteroidList.get(i).getY());
      int sizeI = asteroidList.get(i).getSize() * 10;
      if (space <= sizeI) {
        asteroidList.remove(i);
        player.setHealth(player.getHealth() - 1);
      }
    }
  }

  // Check if bullets hit asteroids
  public static void checkBulletContact() {
    if (bulletList.size() > 0 && asteroidList.size() > 0) {
      for (int i = 0; i < bulletList.size(); i++) {
        for (int j = 0; j < asteroidList.size(); j++) {
          Bullet currentB = bulletList.get(i);
          Asteroids currentA = asteroidList.get(j);
          float d = dist(currentB.getX(), currentB.getY(), currentA.getX(), currentA.getY()); 
          int sizeI = currentA.getSize() * 10;
          if (d <= sizeI) {
            bulletList.remove(i);
            asteroidList.remove(j);
            break;
          }
        }
      }
    }
  }

  // Check if bullets go off the screen
  public static void checkBulletLocation() {
    for (int i = 0; i < bulletList.size(); i++) {
      if (bulletList.get(i).getX() > width || bulletList.get(i).getX() < 0 ||
          bulletList.get(i).getY() > height || bulletList.get(i).getY() < 0) {
        bulletList.remove(i);
        i--;
      }
    }
  }

  // Create new stars
  public static void newStars() {
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star(canvasSize);
    }
  }

  // Create new asteroids
  public static void newAsteroids() {
    for (int i = 0; i < numAsteroids; i++) {
      int asteroidSize = (int)(Math.random() * 10) + 3;
      asteroidList.add(new Asteroids(asteroidSize));
    }
  }

  // Clear all asteroids
  public static void clearAsteroids() {
    asteroidList.clear();
  }

  // Clear all bullets
  public static void clearBullets() {
    bulletList.clear();
  }
}
