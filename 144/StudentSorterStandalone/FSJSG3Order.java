import java.util.*;

public class FSJSG3Order implements Comparator<Student>{
    
    protected ArrayList<String> ClassOrder;
    
   public FSJSG3Order(){
        ClassOrder = new ArrayList<String>();
        ClassOrder.add("Freshman");
        ClassOrder.add("Sophomore");
        ClassOrder.add("Junior");
        ClassOrder.add("Senior");
        ClassOrder.add("Graduate");
        
   }
   
   public int compare(Student left, Student right){
      if(left.getUnivClass().equals(right.getUnivClass())) 
         return 0; // Both in same University class
      else {
         for(int i = 0; i<ClassOrder.size(); i++){
            if(left.getUnivClass().equals(ClassOrder.get(i))) return -1;
            else if(right.getUnivClass().equals(ClassOrder.get(i))) return +1;
         }
         assert false: "error occurred("+ left.getUnivClass() +","+ right.getUnivClass() +")";                       // what's the error??
         return +1; // have to put a return here to avoid "missing return" error
      }
   }
   	
}