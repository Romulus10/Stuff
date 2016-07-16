   import java.io.*;
   import java.util.*;

    public class MorseHashDriver{
   
       public static void main(String[] argv) throws IOException{

         MorseHash M = new MorseHash("Morse.txt");
			M.makeReverseHash();
         System.out.println(M.verifyEncoder());
         System.out.println(M.verifyDecoder());

         BufferedReader buf = new BufferedReader(new FileReader("mixedMessages.txt"));
         while(buf.ready()){
				
            String message = buf.readLine().toUpperCase();
				System.out.println("MESSAGE:\n\t"+message);
				System.out.println("TRANSLATION:\n\t"+M.translate(message));

            System.out.println();
         }
      	/**/
      }
   }
