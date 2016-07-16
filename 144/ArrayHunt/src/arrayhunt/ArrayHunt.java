package arrayhunt;

/*
 NAME: Sean Batzel
 If you worked with someone:
 List individuals:
	
 What was your contribution:


 If you helped someone, for each person, list who and how you helped.




 If someone helped you, for each person, list who and how you helped.




 */
import java.io.*;
import java.util.*;

/**
 * An array implementation of the Hunt interface
 * 
*/
public class ArrayHunt implements Hunt {

    private SteppingStone[] path = new SteppingStone[150];
    private int size;
    private int start;

    public void initialize(String fileName) throws IOException {
        // Sets up a buffer and links the file to the buffer
        BufferedReader buffer = new BufferedReader(new FileReader(fileName));
        // Reads the first line, which contains a number, translate the string to a number and places it in start
        this.start = Integer.valueOf(buffer.readLine()).intValue();
        // index keep track of the array position being filled
        int index = 0;
        // Loop until the buffer runs out of records
        while (buffer.ready()) {
            try {
                // Place the buffer contents into a string tokenizer using the tab token
                StringTokenizer token = new StringTokenizer(buffer.readLine(), "\t");
                // first token is a char, second in an int, use them to construct a SteppingStone
                SteppingStone Stone = new SteppingStone(token.nextToken(), Integer.valueOf(token.nextToken()));
                // Place the stone in the array
                this.path[index] = Stone;
                // increment the array index
                index++;
            } catch (NoSuchElementException e) {
                break;
            }
        }
        // index is the count of the number of SteppingStones placed in the path
        this.size = index;
    }

    public String toString() {
        String answer = "";
        // for each SteppingStone
        for (int i = 0; i < this.size; i++) {
            // Place string representation of first SteppingStone into the answer
            if (answer == "") {
                answer = this.path[i].toString();
            } // Append all other SteppingStones with a dash in between
            else {
                answer += " - " + this.path[i].toString();
            }
        }
        // Return the string representation
        return answer;
    }

    public String hunt() {
        String answer = "";
        // Initializing i to handle mmoving through the construct.
        int i = start;
        while (true) {
            // Concatenate the existing answer with the letter at the current stepping stone.
            answer = answer + this.path[i].getSymbol();
            // Get the direction and distance from the Stepping Stone construct.
            int x = this.path[i].getDirection();
            // If the 'direction' value is 0, don't bother getting the next direction, just skip the end.
            if(x==0){
                break;
            }
            // Add the direction to the current location to find the next value.
            i = i + (x);
        }
        // Send the whole string back to the program.
        return answer;
    }
}
