public class Bullet extends Floater {
    public Bullet(Spaceship theShip) {
        corners = 0;
        xCorners = new int[0];
        yCorners = new int[0];
        myColor = color(255, 255, 0);
        myCenterX = theShip.myCenterX;
        myCenterY = theShip.myCenterY;
        myXspeed = theShip.myXspeed;
        myYspeed = theShip.myYspeed;
        myPointDirection = theShip.myPointDirection;
        accelerate(6);
    }

    public void show() {
        fill(myColor);
        noStroke();
        ellipse((float) myCenterX, (float) myCenterY, 5, 5);
    }
}
