import java.util.*;

public class StudentAlpha implements Comparator<Student>{

	public int compare(Student left, Student right){
		return left.getName().compareTo(right.getName());
	}
}