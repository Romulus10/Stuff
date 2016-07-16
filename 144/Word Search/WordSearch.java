   import java.util.*;
   import java.io.*;
	
   import java.awt.*;
   import scranton.visual.*;

   public class WordSearch {
   
      VJFrame F;
      int dx = 30;
      int dy = 30;
      int timing = 10;
   	
      ArrayList<String> word;
   	
      private class Coordinate{
         Integer r;
         Integer c;
      	
         private Coordinate(Integer row, Integer col){
            this.r = row; this.c = col;
         }
      	
      }
   
      Hashtable<String, ArrayList<Coordinate>> H = new Hashtable<String, ArrayList<Coordinate>>();
        
      public WordSearch(VJFrame F){
         this.F = F;
      }
   
      public void initialize(String[][] mat, int rows, int cols, String fileName) throws IOException {
         BufferedReader buffer = new BufferedReader( new FileReader(fileName));
         String s;
         for (int i = 0; i < rows; i++) {
            s = buffer.readLine();
            for (int j = 0; j < cols; j++) {
               mat[i][j] = s.substring(j, j+1);
               if(!H.containsKey(mat[i][j])){
                  H.put(mat[i][j], new ArrayList<Coordinate>());
               }
               H.get(mat[i][j]).add(new Coordinate(i, j));
            }
         }
      }
   
      public void display(String[][] mat){
         for(int i=0; i<mat.length; i++){
            for(int j=0; j<mat[i].length; j++){
               System.out.print(mat[i][j]+" ");
               F.add(new JRectangle(dx*j, dy*i, dx, dy, Color.black, Color.white), timing);
               F.add(new JString(dx*j+5, dy*i+25, mat[i][j], Color.black), timing);
            }
            System.out.println();
            F.add(new JString(dx*mat[i].length+5, dy*i+25, Integer.toString(i), Color.white),timing);
         }
         for(int j=0; j<mat[0].length; j++){
            F.add(new JString(dx*j+5, dy*mat.length+25, Integer.toString(j), Color.white), timing);
         }
      }
   
      public boolean match(String[][] matrix, int row, int col, String word, Direction d){
      
         String check = word.substring(0, 1);
         int index = 1;
         while (index < word.length()) {
            if (matrix[row + d.deltaRow][col + d.deltaCol].equals(word.substring(index, index+1)) ) {
               index++;
               check = check + matrix[row + d.deltaRow][col + d.deltaCol];
               row = row + d.deltaRow;
               col = col + d.deltaCol;
            }             
            else {
               return false;
            };
         }
         if (check.equalsIgnoreCase(word)) {
            return true;
         } 
         else {
            return false;
         }
      }
   
      public void displayWord(String[][] matrix, int row, int col, String word, Direction d){
      
         for(int index = 0; index < word.length(); index++){
            int drow = index*d.getDeltaRow();
            int dcol = index*d.getDeltaCol();
            F.add(new JRectangle(dx*(col+dcol), dy*(row+drow), dx, dy, Color.black, Color.green), timing);
            F.add(new JString(dx*(col+dcol)+5, dy*(row+drow)+25, matrix[row+drow][col+dcol], Color.black), 500);
         }
      	
         try {
            Thread.sleep(2000);
         } 
            catch (Exception e) {}
      	
         for(int index = 0; index < word.length(); index++){
            int drow = index*d.getDeltaRow();
            int dcol = index*d.getDeltaCol();
            F.add(new JRectangle(dx*(col+dcol), dy*(row+drow), dx, dy, Color.black, Color.white), timing);
            F.add(new JString(dx*(col+dcol)+5, dy*(row+drow)+25, matrix[row+drow][col+dcol], Color.black), 500);
         }
      
      }
   
      public void findWords(String[][] matrix, String fileName) throws IOException {
         BufferedReader buf = new BufferedReader(new FileReader(fileName));
         int wrdCnt = 0;
         int row = 1;
         int deltaX = this.dx*(3+matrix.length);
         while(buf.ready()){
            boolean found = false;
            Direction d;
            String word = buf.readLine();
         	
            F.add(new JString(deltaX, dy*row, word, Color.yellow), timing);
            wrdCnt++;
            if(wrdCnt%2 == 0){
               deltaX = this.dx*(3+matrix.length);
               row++;
            } 
            else {
               deltaX+=150;
            }
         	
            for(Integer i=1; (i<matrix.length-1) && (!found); i++){
               for(Integer j=1; (j<matrix[i].length-1) && (!found); j++){
                  F.add(new JRectangle(dx*j, dy*i, dx, dy, Color.black, Color.yellow), 20);
                  F.add(new JString(dx*j+5, dy*i+25, matrix[i][j], Color.black), 20);
                  if (matrix[i][j].equals(word.substring(0, 1)) ){
                     for(Directions Dir=new Directions();(!found) && (Dir.hasNext());){
                        d = (Direction)Dir.next();
                        found = match(matrix, i, j, word, d);
                        if(found){
                           displayWord(matrix, i, j, word, d);
                           System.out.println(word+" found at ("+i+","+j+") heading "+d.getName());
                        }
                     }
                  }
                  F.add(new JRectangle(dx*j, dy*i, dx, dy, Color.black, Color.white), 20);
                  F.add(new JString(dx*j+5, dy*i+25, matrix[i][j], Color.black), 20);
               }
            }
            if(!found)
               System.out.println(word+" not found");
         }
      }
   
   }