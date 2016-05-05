package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class DoubleArrayWrapper {

    int[] one;
    char[] two;

    /**
     *
     * @param a
     * @param b
     */
    public DoubleArrayWrapper(int[] a, char[] b) {
        this.one = a;
        this.two = b;
    }

    /**
     *
     * @return
     */
    public int[] getA() {
        return one;
    }

    /**
     *
     * @return
     */
    public char[] getB() {
        return two;
    }
}
