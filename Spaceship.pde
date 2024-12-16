class Spaceship extends Floater {

    private int[] boostX;
    private int[] boostY;
    private int[] tempX;
    private int[] tempY;
    private int originalColor;

    public Spaceship() {
        corners = 3;
        xCorners = new int[]{-8, 16, -8};
        yCorners = new int[]{-8, 0, 8};
        tempX = xCorners;
        tempY = yCorners;

        boostX = new int[]{-10, -10, -18};
        boostY = new int[]{-8, 8, 0};

        originalColor = color(255);

        myColor = originalColor;
        myCenterX = 300;
        myCenterY = 300;
        myDirectionX = 0;
        myDirectionY = 0;
        myPointDirection = 0;
    }

    public void boost() {
        myColor = color(255, 69, 0);
        xCorners = boostX;
        yCorners = boostY;
        super.show();
        xCorners = tempX;
        yCorners = tempY;
        myColor = originalColor;
    }

    public void restart() {
        myCenterX = 300;
        myCenterY = 300;
        myDirectionX = 0;
        myDirectionY = 0;
        myPointDirection = 0;
    }

    public void stop() {
        myDirectionX = 0;
        myDirectionY = 0;
    }

    public void hyperSpace() {
        myCenterX = (int) (Math.random() * width);
        myCenterY = (int) (Math.random() * height);
        myPointDirection = Math.random() * 361;
    }

    public double getCenterX() {
        return myCenterX;
    }

    public double getCenterY() {
        return myCenterY;
    }

    public double getPointDirection() {
        return myPointDirection;
    }

    public double getDirectionX() {
        return myDirectionX;
    }

    public double getDirectionY() {
        return myDirectionY;
    }
}
