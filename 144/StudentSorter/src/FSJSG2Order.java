import java.util.*;

public class FSJSG2Order implements Comparator<Student>{
    
    protected String[] ClassOrder = {"Freshman", "Sophomore", "Junior", "Senior", "Graduate"};
    
   public FSJSG2Order(){
        
   }
   
   public int compare(Student left, Student right){
      if(left.getUnivClass().equals(right.getUnivClass())) 
         return 0; // Both in same University class
      else {
         for(int i = 0; i<ClassOrder.length; i++){
            if(left.getUnivClass().equals(ClassOrder[i])) return -1;
            else if(right.getUnivClass().equals(ClassOrder[i])) return +1;
         }
         assert false: "error occurred("+ left.getUnivClass() +","+ right.getUnivClass() +")";                       // what's the error??
         return +1; // have to put a return here to avoid "missing return" error
      }
   }
   	
}