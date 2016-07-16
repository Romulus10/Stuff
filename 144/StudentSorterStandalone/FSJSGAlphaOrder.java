import java.util.*;

public class FSJSGAlphaOrder implements Comparator<Student>{

   public int compare(Student left, Student right){
      Comparator<Student> classOrder = new FSJSGOrder();
      Comparator<Student> alphaOrder = new StudentAlpha();
      int i = classOrder.compare(left, right);
       return 0;




   }

}