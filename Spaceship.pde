class Spaceship extends Floater {
    private ArrayList<Laser> lasers;

    Spaceship() {
        corners = 3;
        xCorners = new int[]{-20, 20, -20};
        yCorners = new int[]{-20, 0, 20};
        myColor = color(255, 255, 255);
        myCenterX = width / 2;
        myCenterY = height / 2;
        myXspeed = 0;
        myYspeed = 0;
        myPointDirection = 0;
        lasers = new ArrayList<>();
    }

    public void hyperspace() {
        myXspeed = 0;
        myYspeed = 0;
        myCenterX = Math.random() * width;
        myCenterY = Math.random() * height;
        myPointDirection = Math.random() * 360;
    }

    public void fireLaser() {
        lasers.add(new Laser(myCenterX, myCenterY, myPointDirection));
    }

    public void updateLasers() {
        for (int i = lasers.size() - 1; i >= 0; i--) {
            Laser laser = lasers.get(i);
            laser.move();
            laser.show();
            if (laser.offScreen()) {
                lasers.remove(i);
            }
        }
    }

    public boolean checkLaserCollision(Asteroid asteroid) {
        for (int i = lasers.size() - 1; i >= 0; i--) {
            if (lasers.get(i).hits(asteroid)) {
                lasers.remove(i); // Remove laser on collision
                return true;
            }
        }
        return false;
    }
}

