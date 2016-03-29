/* 
   Sean Batzel
   CMPS 250 - Spring 2016
   Assignment 01 - Unlimited Unsigned Integers
   The driving class for the UUI system.
   Adapted from the client provided by P.M.J.
   The issues recorded in the UUI class are addressed and fixed in this class.
*/
package uuiaccumulator;
import java.util.*;
public class UUIAccumulator {
    static Scanner keyboard = new Scanner(System.in);
    public static void main(String args[]) {
        final UUI SENTINEL = new UUI("0");
        UUI value;
        UUI accumulator = new UUI("0");
        System.out.println("SENTINEL is "+SENTINEL.toString());
        System.out.println("Accumulator is "+accumulator.toString());
        do {
            System.out.print("Enter an UUI:");
            value = new UUI(keyboard.nextLine());
            try{
                Integer.parseInt(value.content);
            }
            catch(Exception e){
                value.content = "0";
            }
            System.out.println("value is "+value.toString());
            if(value.NE(SENTINEL)) {
                accumulator.add(value);
                System.out.println("Current accumulation is "+accumulator.toString());
                //System.out.println("Which is equivalent to  "+accumulator.toStringf());
                //UUI.toStringf() is not implemented.
            }
        } while(value.NE(SENTINEL));
        System.out.println("Final accumulation is   "+accumulator.toString());
        //System.out.println("Which is equivalent to  "+accumulator.toStringf());
        //UUI.toStringf() is not implemented.
    }
}