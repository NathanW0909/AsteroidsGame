class Spaceship extends Floater {
    Spaceship() {
        corners = 3;
        xCorners = new int[]{-10, 10, -10};
        yCorners = new int[]{-10, 0, 10};
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
}

