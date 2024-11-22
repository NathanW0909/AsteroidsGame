class Star {
    private double x, y;

    Star() {
        x = Math.random() * width;
        y = Math.random() * height;
    }

    public void show() {
        stroke(255);
        point((float)x, (float)y);
    }
}
