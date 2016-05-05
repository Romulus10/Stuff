package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class StringUtilities {

    public static String removeLeadingZeros(String x) {
        int y = 0;
        while (x.charAt(y) != 1 && y < x.length() - 2) {
            if (x.charAt(y) == 0) {
                x = x.replace(Character.toString(x.charAt(y)), "");
            }
            if (x.charAt(y) == 1) {
                break;
            }
            y++;
        }
        return x;
    }
}
