import java.io.*; 
import java.util.*; 


public class RoleDiceTest { 


	public static void main (String[] args){ 
		RollDice Dice = new RollDice(); // Construct a RollDice object 
		Dice.roll(100); // Roll the pair of dice and record the result 
		Integer[] rollCount = Dice.results(); // Obtain the array of dice results 
		for (int i = 0; i <13; i++){ 
			System.out.println(i+"\t"+rollCount[i]); // Display sum i and the number of times it appears 
		} 
	} 
} 
