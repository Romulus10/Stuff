   import java.io.*;

/**
* Student class.  Used to illustrate Comparator constructions
*/
    public class Student {
   
      protected String RID;
      protected String Name;
      protected String email;
      protected String UnivClass;
      protected String major;
   
   /**
   * Class Constructor
   */
       public Student(String RID, String Name, String email, String UnivClass, String major){
         this.RID = RID;
         this.Name = Name;
         this.email = email;
         this.UnivClass = UnivClass;
         this.major = major;
      }
   
   /**
   * @return access to RID
   */
       public String getRID(){
         return this.RID;}
   	
   /**
   * @return access to name
   */
       public String getName(){
         return this.Name;}
   	
   /**
   * @return access to email address
   */
       public String getEmail(){
         return this.email;}
   	
   /**
   * @return access to University class - Freshman, Sophomore, Junior, Senior, Other, ...
   */
       public String getUnivClass(){
         return this.UnivClass;}
   	
   /**
   * @return Access to major
   */
       public String getMajor(){
         return this.major;}
   	
   /**
   * @return toString of Student object
   */
       public String toString(){
         return this.getRID()+"\t"+this.getName()+"\t"+this.getEmail()+"\t"+this.getUnivClass()+"\t"+this.getMajor();
      }
   	
   }
