package a.greedy.algorithm;

   import java.io.*;
   import java.util.*;
   import java.awt.*;
   import javax.swing.*;
   import java.awt.event.*;
   import scranton.visual.*;

   public class Greedy{
   
      Grapher G;
      JMap M;
      VJFrame frame;
      Color[] C = {Color.white, Color.red, Color.yellow, Color.green, Color.blue};
      Stack<NodeInfo> Valid, Working;
   	
      public Greedy(Grapher G, JMap M){
         this.G = G;
         this.M = M;
         this.frame = new VJFrame("Greedy Algorithm on U.S. Map");
         Valid = new Stack<NodeInfo>();
         Working = new Stack<NodeInfo>();
      
         ArrayList<String> Seq = G.getSeq();
         for(Integer i = Seq.size()-1; i >= 0; i--){
            String id = Seq.get(i);
            System.out.println(id);
            NodeInfo N = G.refNode(id);
            Working.push(N);
            N.setColor(0);
            M.displayElement(N.getName(), C[N.getColor()], frame);
         }
      
      }
   	
      public void go(){
         Integer counter = 0;
         Integer backup = 0;
         while(!Working.empty()){
         	// work on the item at the top of the working stack
            NodeInfo Current = Working.peek();
         
         
         
         	// Insert this statement everytime you change the color of a map node
            M.displayElement(Current.getName(), C[Current.getColor()], frame);
				
				
				/*Move items from one stack to the other with statements like
				*
				*               Working.push(Valid.pop());
				* and
				*               Valid.push(Working.pop());
				*
				*/
         	
         }
      }
   	
   }
