package list.hunt;

/*
NAME:
If you worked with someone:
	List individuals:
	
	What was your contribution:


If you helped someone, for each person, list who and how you helped.




If someone helped you, for each person, list who and how you helped.




*/
   import java.io.*;
   import java.util.*;
   import scranton.list.*;

/**
* An array implementation of the Hunt interface
*
*/
    public class ListHunt implements Hunt{
      private PositionalList<SteppingStone> path = new PositionalListStandard<SteppingStone>();
   	//private int size;
      private int start;
   	
       public void initialize(String fileName) throws IOException {
         BufferedReader buffer = new BufferedReader(new FileReader(fileName));
         this.start = Integer.valueOf(buffer.readLine()).intValue();
         int index = 0;
         this.path.toFront();
         while (buffer.ready()){
            StringTokenizer token = new StringTokenizer(buffer.readLine(), "\t");
            SteppingStone Stone = new SteppingStone(token.nextToken(), Integer.valueOf(token.nextToken()));
            this.path.insert(Stone);
            this.path.next();
         }
         //this.size = index;
      }
   
       public String toString(){
         return this.path.toString();
      }
   
       public String hunt(){
         String answer = "";
         int move = this.start;
         this.path.toFront();
         while(move!=0){
         
         
         
         
         
         
         
         }
         return answer;
      }
   
   }
