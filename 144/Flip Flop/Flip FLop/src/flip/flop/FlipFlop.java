/*
Name: Sean Batzel

Who did you help?


How did you help them?


Who helped you?


How were you helped?


*/
package flip.flop;

import java.util.*;
import javax.swing.*;

public class FlipFlop {

	public static void FlipFlop(Integer a, Integer b, Integer Max){
		//The commented lines of code were debugging and testing lines.

		//System.out.println(a);
		//System.out.println(b);
		//System.out.println(Max);

		//Run through all numbers from 1 to the upper bound.
		//Max needs one added to it in order to bypass the usual i to j-1 loop process.
		for (int i = 1; i < Max+1; i++)
		{
			//System.out.print(a+ " " + b + " " + i + " ");
			//The mod function returns the remainder when x is divided by y where (x % y) is the expression.
			//If the number i is divisible by either a or b, i mod (a/b) will return 0.
			//Otherwise, some other value will be returned.

			//Condition: i is divisible by a.
			if (i % a == 0)
			{
				//Print "flip"
				System.out.println("Flip.");
			}

			//Condition: i is divisible by b.
			if (i % b == 0)
			{
				//Print "flop"
				System.out.println("Flop.");
			}

			//Condition: i isn't divisible by either.
			if (i % a != 0 && i % b != 0)
			{
				//Just print the number.
				System.out.println(i);
			}
		}
	}

	public static void main (String[] arg){
		Integer a;
		Integer b;
		Integer max;
		String Title = "FlipFlop Assignment";
		String data = JOptionPane.showInputDialog(null, "Enter your first number", Title, 1);
		a = new Integer(data);
		data = JOptionPane.showInputDialog(null, "Enter your second number", Title, 1);
		b = new Integer(data);
		data = JOptionPane.showInputDialog(null, "Enter the upper bound", Title, 1);
		max = new Integer(data);
		FlipFlop(a, b, max);
	}
}