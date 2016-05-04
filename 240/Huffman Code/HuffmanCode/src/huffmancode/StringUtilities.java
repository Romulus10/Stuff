/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huffmancode;

//I realize I'm probably reinventing the wheel but I wasn't really sure how to use existing utilities for this.

import java.util.Arrays;


/**
 *
 * @author Sean Batzel
 */
public class StringUtilities {
    public static String removeLeadingZeros(String x){
        char[] z = x.toCharArray();
        int y = 0;
        while (z[y] != 1){
            if (z[y] == 0){
                for (int i = y; i < z.length; i++){
                    z[i] = z[i+1];
                }
            }
        }
        return Arrays.toString(z);
    }
}
