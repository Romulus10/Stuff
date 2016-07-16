package combinations;

/**
 * NAME: Sean Batzel
 * 
* Who did you help, and how?
 * 
*
 *
 * Who helped you, and how?
 * 
*
 *
 */
public class Combinations {

    private int counter;

    public Combinations() {
        this.counter = 0;
    }

    public void reset() {
        this.counter = 0;
    }

    public int viewCounter() {
        return this.counter;
    }

    public Integer Combo(Integer n, Integer r) {
        this.counter++;
        if (n < r) return -1;
        if (r == 0 | r == n) return 1;
        else return Combo(n-1, r-1) + Combo(n-1, r); 
    }
}
