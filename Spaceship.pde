class Spaceship {
    private int myCenterX, myCenterY;
    private double myDirectionX, myDirectionY;
    private int myPointDirection;

    private int[] xCorners, yCorners;
    private int corners;
    private int myColor;

    public Spaceship() {
        corners = 3;
        xCorners = new int[corners];
        yCorners = new int[corners];
        xCorners[0] = -8;
        yCorners[0] = -8;
        xCorners[1] = 16;
        yCorners[1] = 0;
        xCorners[2] = -8;
        yCorners[2] = 8;

        myColor = 255;
        myCenterX = 300;
        myCenterY = 300;
        myDirectionX = 0;
        myDirectionY = 0;
        myPointDirection = 0;
    }

    public void move() {
        myCenterX += myDirectionX;
        myCenterY += myDirectionY;
    }

    public void show() {
        stroke(myColor);
        fill(myColor, 100, 255);
        beginShape();
        for (int i = 0; i < corners; i++) {
            vertex(myCenterX + xCorners[i], myCenterY + yCorners[i]);
        }
        endShape(CLOSE);
    }

    public void accelerate(double acceleration) {
        myDirectionX += Math.cos(Math.toRadians(myPointDirection)) * acceleration;
        myDirectionY += Math.sin(Math.toRadians(myPointDirection)) * acceleration;
    }

    public void turn(int angle) {
        myPointDirection += angle;
    }

    public void hyperspace() {
        myCenterX = (int)(Math.random() * width);
        myCenterY = (int)(Math.random() * height);
        myPointDirection = (int)(Math.random() * 360);
    }

    public void setDirectionX(double dx) { myDirectionX = dx; }
    public void setDirectionY(double dy) { myDirectionY = dy; }
    public double getX() { return myCenterX; }
    public double getY() { return myCenterY; }
    public double getDirectionX() { return myDirectionX; }
    public double getDirectionY() { return myDirectionY; }
    public double getPointDirection() { return myPointDirection; }
}
