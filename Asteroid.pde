class Asteroid extends Floater {

    private int rotSpeed;

    public Asteroid() {
        corners = 10;
        xCorners = new int[]{0, -15, -20, -25, -20, 0, 20, 25, 20, 15};
        yCorners = new int[]{-30, -25, -15, 0, 15, 25, 15, 0, -15, -25};
        myColor = color(128, 128, 255);
        myDirectionX = Math.random() * 2 - 1;
        myDirectionY = Math.random() * 2 - 1;
        myCenterX = (int) (Math.random() * 601);
        myCenterY = (int) (Math.random() * 601);
        myPointDirection = (int) (Math.random() * 361);
        rotSpeed = (int) (Math.random() * 3 + 1);
    }

    public void show() {
        turn(rotSpeed);
        super.show();
    }

    public double getCenterX() {
        return myCenterX;
    }

    public double getCenterY() {
        return myCenterY;
    }
}
