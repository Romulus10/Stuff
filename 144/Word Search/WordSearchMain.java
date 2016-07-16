   import java.io.*;
	import scranton.visual.*;

   public class WordSearchMain{
   
      public static void main(String [] argv) throws IOException {
         int rows = 17;
         int cols = 17;
         String [][] matrix = new String[rows][cols];
			VJFrame VWS = new VJFrame("Word Search");
         WordSearch W = new WordSearch(VWS);
      	
         W.initialize(matrix, rows, cols, "matrixB.txt");
      
         W.display(matrix);
      
         W.findWords(matrix, "words.txt");
      }
   
   }