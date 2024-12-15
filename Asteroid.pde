public class Asteroid extends Floater {
    private double rotSpeed;

    public Asteroid() {
        corners = 6;
        xCorners = new int[]{-10, -5, 10, 5, 10, -5};
        yCorners = new int[]{-5, -10, -5, 10, 5, 10};
        myColor = color(200, 200, 200);
        myCenterX = random(width);
        myCenterY = random(height);
        myXspeed = random(-2, 2);
        myYspeed = random(-2, 2);
        myPointDirection = random(360);
        rotSpeed = random(-2, 2);
    }

    public void move() {
        myCenterX += myXspeed;
        myCenterY += myYspeed;
        myPointDirection += rotSpeed;
        if (myCenterX > width) myCenterX = 0;
        else if (myCenterX < 0) myCenterX = width;
        if (myCenterY > height) myCenterY = 0;
        else if (myCenterY < 0) myCenterY = height;
    }

    public void show() {
        fill(myColor);
        stroke(myColor);
        pushMatrix();
        translate((float) myCenterX, (float) myCenterY);
        rotate((float) (myPointDirection * Math.PI / 180));
        beginShape();
        for (int i = 0; i < corners; i++) {
            vertex(xCorners[i], yCorners[i]);
        }
        endShape(CLOSE);
        popMatrix();
    }
}

