   import java.io.*;
   import java.util.*;
   import java.awt.*;
   import javax.swing.*;
   import java.awt.event.*;
   import scranton.visual.*;

   public class BrdrXingMain {
   
      public static void main(String argv[]) throws IOException {
         Color[] color = {Color.red, Color.blue, Color.green, Color.cyan, Color.yellow};
         JMap M = new JMap("USMap0.txt");
         Random rnd = new Random();
      
      /**      	
         VJFrame frame = new VJFrame("U.S. Map Demo");
      
         ArrayList<String> PC = M.getIDs();      	
         for(int i=0; i<PC.size(); i++){
            String id = PC.get(i);
         	
            M.displayElement(id, Color.white, frame);
         }
      	
      */
         Grapher G = new Grapher("usa.txt");
      	
         System.out.print("Enter node names separated by white space: ");
         BufferedReader Buffer = new BufferedReader(new InputStreamReader(System.in));
         String Contents = Buffer.readLine();
         StringTokenizer Token = new StringTokenizer(Contents);
         String NodeA = Token.nextToken().toUpperCase();
         String NodeB = Token.nextToken().toUpperCase();
         System.out.println("\nSolve from "+NodeA+" to "+NodeB);
            
         BorderCrossing Bdr = new BorderCrossing(G, M);
      	
         Bdr.go(NodeA, NodeB);
      
      
      /**			
         try {
            Thread.sleep(3000);
         } 
            catch (InterruptedException ex) {}
      
      	while(true){
            String id = PC.get(rnd.nextInt(PC.size()));
            M.displayElement(id, color[rnd.nextInt(color.length)], frame);
         
            try {
               Thread.sleep(500);
            } 
               catch (InterruptedException ex) {}
         }
      */      	
      
      }
   }
