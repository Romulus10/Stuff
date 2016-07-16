package xtothendriver;

/**
 * Sean Batzel
 *
 *
 * Because of the division operators used in the recursive algorithm, the timing
 * of this particular algorithm is an exponential function.
 * I believe the function should be something in the ballpark of 2^x.
 *
 */
public class XN {

    private int counter;

    public XN() {
        this.counter = 0;
    }

    public void reset() {
        this.counter = 0;
    }

    public int viewCounter() {
        return this.counter;
    }

    public double XToTheN(double x, int n) {
        this.counter++;
        // Complete the two assertions correctly
        assert x != 0 && n != 0 : "Indeterminant form, x = " + x + ", n = " + n;
        assert n > 0 : "'n' cannot be negative";
        double one = 1;
        // Complete the recursive algorithm
        if (x == 0.0) {
            return 0.0;
        } else if (n == 0) {
            return one;
        } else if (n == one) {
            return x;
        } else if (n % 2 != 0) {
            double power = XToTheN(x, n - 1);
            return x * power;
        } else {
            double power = x * x;
            return XToTheN(power, n / 2);
        }
    }
}
