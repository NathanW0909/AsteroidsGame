class Bullet extends Floater {

    public Bullet() {
        myCenterX = ss.getCenterX();
        myCenterY = ss.getCenterY();
        myPointDirection = ss.getPointDirection();
        myDirectionX = 7 * Math.cos(ss.getPointDirection() * (Math.PI / 180)) + ss.getDirectionX();
        myDirectionY = 7 * Math.sin(ss.getPointDirection() * (Math.PI / 180)) + ss.getDirectionY();
    }

    public void move() {
        myCenterX += myDirectionX;
        myCenterY += myDirectionY;
    }

    public void show() {
        fill(#FF5733);
        stroke(#FFC300);
        ellipse((float) myCenterX, (float) myCenterY, 15, 15);
    }

    public double getPointDirection() {
        return myPointDirection;
    }

    public double getCenterX() {
        return myCenterX;
    }

    public double getCenterY() {
        return myCenterY;
    }
}
