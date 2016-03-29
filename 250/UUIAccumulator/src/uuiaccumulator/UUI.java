/**
 * Sean Batzel 2/15/2016. Assignment 01 CMPS 250 Completed without assistance.
 * ISSUES: Currently the UUI class has a nervous breakdown if you just hit the
 * enter key at the prompt.
 */
package uuiaccumulator;

public class UUI {

    //Set these aside for access throughout the entire system.
    String content;
    private int[] rep;
    private final int[] thisRep;
    private final int[] addedVal;
    private final String[] newVal;

    public UUI(String value) {
        this.newVal = new String[65];
        this.addedVal = new int[65];
        this.thisRep = new int[65];
        this.rep = new int[65];
        this.content = value;
    }

    public void add(UUI value) {
        this.rep = new int[65];
        int current = value.content.length() - 1;
        //Turn the input into an array of integers.   
        for (int i = 64; i >= 0; i--) {
            rep[i] = Integer.parseInt("" + value.content.charAt(current)); //If it's not a real integer, this throws an exception. 
            current--;
            if (current < 0) {
                break;
            }
        }
        current = this.content.length() - 1;
        //Turn the accumulator into an array of integers.
        for (int i = 64; i >= 0; i--) {
            thisRep[i] = Integer.parseInt("" + this.content.charAt(current));
            current--;
            if (current < 0) {
                break;
            }
        }
        for (int i = 0; i < 65; i++) {
            addedVal[i] = rep[i] + thisRep[i];
            //System.out.println(addedVal[i]);
            //System.out.println("This index's current value: " + addedVal[i]);
            if (addedVal[i] >= 10) {
                // If the current number is  greater than or equal to 10,
                // carry the one.
                addedVal[i] = addedVal[i] - 10;
                addedVal[i - 1]++;
            }
            //System.out.println("This index's new value: " + addedVal[i]);
        }
        for (int i = 0; i < 65; i++) {
            newVal[i] = Integer.toString(addedVal[i]);
            // Turn the accumulator into an array of strings.
        }
        int i = 0;
        //The while loop also throws an exception if the input isn't valid.
        while ("0".equals(newVal[i])) {
            newVal[i] = "";
            i++;
            //Cut off all the leading 0's from the array.
        }
        //Concatenate into a real number and return the value.
        String finalString = "";
        for (i = 0; i < 65; i++) {
            finalString = finalString + newVal[i];
        }
        this.content = finalString;
    }

    @Override
    public String toString() {
        return this.content;
    }

    public boolean NE(UUI value) {
        return (!this.content.equals(value.content));
    }
}
