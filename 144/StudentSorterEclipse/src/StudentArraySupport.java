   import java.io.*;
   import java.util.*;

    public class StudentArraySupport {
   
      private Integer amount; 
   
   /*
   * Constructs and array of Student objects
   * @param fileName Name of the file containing the student information
   * @return Returns the array of Student objects
   * also save the count of the number of student objects in amount
   */   
       public Student[] constructArray(String fileName)throws IOException{
      
         Student[] ans = new Student[10];
         Scanner Sc = new Scanner(new File(fileName));
         Sc.useDelimiter("\t|\n");
         this.amount = 0;
         while(Sc.hasNext()){
            if(this.amount == ans.length){
               ans = doubler(ans);
            }
            String ID = Sc.next();
            String SName = Sc.next();
            String Email = Sc.next();
            String SClass = Sc.next();
            String major = Sc.next();
            ans[this.amount] = new Student(ID, SName, Email, SClass, major);
            amount++;
         }
         return ans;
      }

/*
* @return the count of the number of student objects
*/   
       public Integer getAmount(){
         return this.amount;}

/*
* Used to aadjust to construct a bigger array as more data is read
*/   
       private Student[] doubler(Student[] a){
         Student[] newArray = new Student[2*(a.length)];
         for(int i = 0; i<a.length; i++){
            newArray[i] = a[i];
         }
         return newArray;
      }
   }
