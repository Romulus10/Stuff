   import java.io.*;
   import java.util.*;
   import java.awt.*;
   import javax.swing.*;
   import java.awt.event.*;
   import scranton.visual.*;
   import scranton.queue.*;

   public class BorderCrossing{
   
      Grapher G;
      JMap M;
      VJFrame frame;
      Color[] C = {Color.white, Color.red, Color.yellow, Color.green, Color.blue};
   	
      public BorderCrossing(Grapher G, JMap M){
         this.G = G;
         this.M = M;
         this.frame = new VJFrame("Border Crossing on U.S. Map");
      
         ArrayList<String> Seq = G.getSeq();
         for(Integer i = Seq.size()-1; i >= 0; i--){
            String id = Seq.get(i);
            System.out.println(id);
            NodeInfo N = G.refNode(id);
            N.setColor(0);
            M.displayElement(N.getName(), C[N.getColor()], frame);
         }
      
      }
   	
      public void go(String A, String B){
      
         QueueViaStandard<NodeInfo> Q = new QueueViaStandard<NodeInfo>();
         Integer counter = 0;
         Integer backup = 0;
         Boolean Finished = false;
         NodeInfo start = G.refNode(A);
         start.Qed = true;
         Q.insert(start);
         while (!Q.isEmpty() & !Finished){
            // Complete the code
			NodeInfo workingNode = Q.remove();
			workingNode.setColor(1);
            M.displayElement(workingNode.getName(), C[workingNode.getColor()], frame);
            for(int i = 0; i < workingNode.noOfNeighbors(); i++){
				if (!workingNode.getNeighbor(i).Qed){
					workingNode.getNeighbor(i).Qed = true;
					workingNode.getNeighbor(i).setParent(workingNode);
					Q.insert(workingNode.getNeighbor(i));
					workingNode.getNeighbor(i).setColor(4);
					if(workingNode.getNeighbor(i).getName() == B){
						Finished = true;
					}
				}
			}
            // Complete the code
            workingNode.setColor(3);
         }
         NodeInfo Node = G.refNode(B);
         while(Node!=null){
            // Complete the code
			
            M.displayElement(Node.getName(), C[Node.getColor()], frame);
            // Complete the code
         
         }
         // Code to color the states in the path your found
         while(!Q.isEmpty()){
			 NodeInfo next = Q.remove();
			 next.setColor(2);
			 M.displayElement(next.getName(), C[Node.getColor()], frame);
		 }
      }
   	
   }
