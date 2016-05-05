/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huffmancode;

//I realize I'm probably reinventing the wheel but I wasn't really sure how to use existing utilities for this.
/**
 *
 * @author Sean Batzel
 */
public class StringUtilities {

    public static String removeLeadingZeros(String x) {
        //System.out.println(x);
        int y = 0;
        while (x.charAt(y) != 1 && y < x.length() - 2) {
            //System.out.println(x.charAt(y));
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
