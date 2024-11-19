class Spaceship extends Floater  
{   
    //your code here
}


class Doodad {
    private double myNum;

    public Doodad() {
        myNum = 0;
    }

    public double getNum() {
        return myNum;
    }

    public void setNum(double n) {
        myNum = n;
    }
}

public class Main {
    public static void setup() {
        Doodad d1 = new Doodad();
        Doodad d2 = new Doodad();

        d1.setNum(3.14);
        d2.setNum(2.719870195388794);

        double sum = d1.getNum() + d2.getNum();
        System.out.println("Sum is " + sum);
    }

    public static void main(String[] args) {
        setup();
    }
}
