package list.hunt;

   import java.io.*;

/**
* Main program to drive the ArrayHunt implementation of the Hunt interface.
*
* @author J. Beidler
*/
    class ListHuntMain {
   
       public static void main(String[] argv) throws IOException{
         Hunt H = new ListHunt();
         H.initialize("hunt_tokens.txt");
         System.out.println(H.toString());
         System.out.println(H.hunt());
      }
   
   }