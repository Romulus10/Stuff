/*
NAME:
If you worked with someone:
	List individuals:
	
	What was your contribution:


If you helped someone, for each person, list who and how you helped them.




If someone helped you, for each person, list who and how they helped you.




*/
import java.io.*;
import java.util.*;

public class StackHunt implements Hunt {
	private Stack<SteppingStone> left = new Stack<SteppingStone>();
	private Stack<SteppingStone> right = new Stack<SteppingStone>();
	private int start;
	
	public void initialize(String fileName) throws IOException {
      // Put the stones in the left stack as you read create them



      // Slinky the stones from the left stack to the right stack.


      //The left stack should be empty and the right stack should have all the stones
		// and the top stone is the first stone on the walk.
	}
	
	public String toString(){
		int count = 0;
		while(!this.left.empty()){
			this.right.push(this.left.pop());
			count++;
		}
		String ans = this.right.toString();
		while(count!=0){
			this.left.push(this.right.pop());
			count--;
		}
		return ans;
	}
	
	public String hunt(){
		String answer = "";
		int move = this.start;
		while(move!=0){






		}
		return answer;
	}


}
