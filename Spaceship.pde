class Spaceship extends Floater {
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
    }

    public void hyperspace() {
        myXspeed = 0;
        myYspeed = 0;
        myCenterX = Math.random() * width;
        myCenterY = Math.random() * height;
        myPointDirection = Math.random() * 360;
    }

    public double getX() {
        return myCenterX;
    }

    public double getY() {
        return myCenterY;
    }

    public double getDirection() {
        return myPointDirection;
    }
}
