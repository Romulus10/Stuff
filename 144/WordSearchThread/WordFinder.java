   import java.util.*;
   import java.io.*;
	
   import java.awt.*;
   import scranton.visual.*;

   public class WordFinder extends Thread{
   
      WordSearch W;
		WSViewer F;
      Color color;
   
      public WordFinder(WordSearch W, WSViewer F, Color c){
         this.W = W;
			this.F = F;
         this.color = c;
      }
   	
      public void run(){
         String word = W.getWord(color);
         while (!word.equals("")){
         
            boolean found = false;
            Direction d;
         	
            ArrayList<Coordinate> L = W.H.get(word.substring(0,1));
         	
            for(int c=0; (c<L.size()) && (!found); c++){
               int i = L.get(c).r;
               int j = L.get(c).c;
					/* Add code to find the word, then use calls like
               * F.cellBack(i, j, Color.black, color);
               * F.cellContent(i, j, W.mat[i][j], Color.black);
					* to display and undisplay the word.
            	*/
            
            }
            if(!found)
               System.out.println(word+" not found");
         
            word = W.getWord(color);
         }
      }
   	
   
   }
