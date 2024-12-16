Spaceship ss = new Spaceship();
Star[] starArr = new Star[200];
ArrayList<Asteroid> astArr = new ArrayList<>();
ArrayList<Bullet> bulArr = new ArrayList<>();
boolean aTurn = false;
boolean dTurn = false;
boolean wMove = false;
boolean spaceShoot = false;
boolean gameOver = false;
int score = 0;

public void setup() {
    size(600, 600);
    background(0);
    for (int i = 0; i < starArr.length; i++) starArr[i] = new Star();
    for (int i = 0; i < 10; i++) {
        astArr.add(new Asteroid());
        astArr.get(i).accelerate(2);
    }
}

public void draw() {
    background(0);
    for (Star star : starArr) star.show();
    ss.move();
    ss.show();
    if (aTurn) ss.turn(-4);
    if (dTurn) ss.turn(4);
    if (wMove) {
        ss.accelerate(.07);
        ss.boost();
    }
    if (spaceShoot) bulArr.add(new Bullet());
    for (Asteroid asteroid : astArr) {
        asteroid.move();
        asteroid.show();
    }
    for (int i = 0; i < bulArr.size(); i++) {
        bulArr.get(i).move();
        bulArr.get(i).show();
        if (bulArr.get(i).getCenterX() < 0 || bulArr.get(i).getCenterX() > width || bulArr.get(i).getCenterY() < 0 || bulArr.get(i).getCenterY() > height) {
            bulArr.remove(i);
            i--;
        }
    }
    fill(#d3d3d3);
    textSize(50);
    text("Score: " + score, width / 2 - 100, height / 2 - 225);
    for (int i = 0; i < astArr.size(); i++) {
        if (dist((float) (ss.getCenterX()), (float) (ss.getCenterY()), (float) (astArr.get(i).getCenterX()), (float) (astArr.get(i).getCenterY())) < 20) {
            gameOver = true;
            break;
        }
        for (int a = 0; a < bulArr.size(); a++) {
            if (dist((float) (bulArr.get(a).getCenterX()), (float) (bulArr.get(a).getCenterY()), (float) (astArr.get(i).getCenterX()), (float) (astArr.get(i).getCenterY())) < 20) {
                astArr.remove(i);
                bulArr.remove(a);
                score++;
                break;
            }
        }
    }
    if (gameOver) gameEnd();
    noFill();
    stroke(204, 102, 0);
    strokeWeight(10);
    rect(0, 0, 600, 600);
    stroke(0);
    strokeWeight(1);
    if (astArr.size() == 0) {
        for (int i = 0; i < 10; i++) {
            astArr.add(new Asteroid());
            astArr.get(i).accelerate(2);
        }
    }
}

public void gameEnd() {
    fill(255);
    textSize(100);
    text("Game Over", width / 2 - 275, height / 2);
    textSize(50);
    text("Enter - Restart", width / 2 - 175, height / 2 + 75);
    ss.stop();
}

public void keyPressed() {
    if (key == 'a') aTurn = true;
    if (key == 'd') dTurn = true;
    if (key == 'w') wMove = true;
    if (key == ' ') spaceShoot = true;
    if (key == 's') ss.stop();
    if (key == 'q') {
        ss.stop();
        ss.hyperSpace();
    }
    if (key == ENTER) {
        gameOver = false;
        ss.restart();
        starArr = new Star[200];
        astArr = new ArrayList<>();
        bulArr = new ArrayList<>();
        score = 0;
        aTurn = false;
        dTurn = false;
        wMove = false;
        spaceShoot = false;
        setup();
    }
}

public void keyReleased() {
    if (key == 'a') aTurn = false;
    if (key == 'd') dTurn = false;
    if (key == 'w') wMove = false;
    if (key == ' ') spaceShoot = false;
}
