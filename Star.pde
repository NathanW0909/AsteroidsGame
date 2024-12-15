
public class Star {
    private float x, y, size;

    public Star() {
        x = random(width);
        y = random(height);
        size = random(1, 3);
    }

    public void show() {
        fill(255);
        noStroke();
        ellipse(x, y, size, size);
    }
}
