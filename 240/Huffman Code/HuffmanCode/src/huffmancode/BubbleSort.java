package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class BubbleSort {

    /**
     *
     * @param x
     * @return
     */
    public static int[] bubbleSort(int[] x) {
        int[] y = new int[x.length];
        char[] z = new char[x.length];
        int[] g = new int[x.length];
        for (int i = 0; i < x.length; i++) {
            if (x[i] > 0) {
                y[i] = x[i];
                z[i] = ((char) i);
            }
        }
        @SuppressWarnings("UnusedAssignment")
        boolean swapped = false;
        do {
            swapped = false;
            for (int a = 0; a < y.length - 1; a++) {
                if (y[a] > y[a + 1]) {
                    int tmp = y[a];
                    char tmp2 = z[a];
                    y[a] = y[a + 1];
                    z[a] = z[a + 1];
                    y[a + 1] = tmp;
                    z[a + 1] = tmp2;
                    swapped = true;
                }
            }
        } while (swapped);
        for (int r = 0; r < x.length; r++){
            g[z[r]] = y[r];
        }
        return g;
    }
}
