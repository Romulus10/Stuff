   import java.util.*;

    public class FSJSGOrder implements Comparator<Student>{
   
       public int compare(Student left, Student right){
         if(left.getUnivClass().equals(right.getUnivClass())) return 0; // Both in same University class
         else if(left.getUnivClass().equals("Freshman")) return -1; // Left's a freshman and Right is further on
         else if(right.getUnivClass().equals("Freshman")) return +1;// Right's a freshman and Left is further on
         else if(left.getUnivClass().equals("Sophomore")) return -1;// Left's a sophomore and Right's further on
         else if(right.getUnivClass().equals("Sophomore")) return +1;// etc.
         else if(left.getUnivClass().equals("Junior")) return -1;    // etc.
         else if(right.getUnivClass().equals("Junior")) return +1;   // etc.
         else if(left.getUnivClass().equals("Senior")) return -1;    // etc.
         else if(right.getUnivClass().equals("Senior")) return +1;   // etc.
         else if(left.getUnivClass().equals("Graduate")) return -1;    // etc.
         else if(right.getUnivClass().equals("Graduate")) return +1;   // etc.
         else {
            assert false: "error occurred";                       // what's the error??
            return +1; // have to put a return here to avoid "missing return" error
         }
      }
   	
   }