import java.io.*;
import java.util.*;

public class StudentArrayTest {

	public static void main(String argv[]) throws IOException {
		//Comparator<Student> sc = new MajorOrder();
		Comparator<Student> sc = new StudentAlpha();
		StudentArraySupport ss = new StudentArraySupport();
                File file = new File("StudentData.txt");
                System.out.println(System.getProperty("user.dir"));
                System.out.println(file.getAbsolutePath());
		Student[] ST = ss.constructArray(file.getAbsolutePath());
		Arrays.sort(ST, 0, ss.getAmount(), sc);
		Integer actualSize = ss.getAmount();
		for(int i = 0; i<actualSize; i++){
			System.out.println(ST[i].toString());
		}
	}
}