import java.util.*;

/*
* A class to support basic manipulation of a standard six-sided pair of dice
*/
public class Dice {

   /*
   * Attributes: Instances of the two die
   */
   private Die Die1, Die2;
   
   /*
   * Attribute: Instance of a random number generator
   */
   private Random seed;

   /*
   * Constructor: Create instance of a pair of dice
   * Creates the seed for the random number generator
   */
   public Dice(){
      this.Die1 = new Die();
      this.Die2 = new Die();
      seed = new Random();
   }

   /*
   * Rolls the pair of dice - sets the two die values
   */
   public void roll(){
      Die1.set();
      Die2.set();
      
   }

   /*
   * Access the value of each die in the pair
   */
   public Integer get(Integer num){
      if (num == 1) 
         return Die1.get();
      else if (num == 2) 
         return Die2.get();
      else {
         assert false: "*** Get die error: " +num + " not 1 or 2";
         return -1;
      }   
   }

   /*
   * Since this class is private it can only be accessed by code in this file
   */
   private class Die {
   
      /*
      * The face attribute of the die
      */
      private Integer face;
   
      /*
      * Constructor initializes the face attribute to an illegal value (die not rolled)
      */
      private Die (){
         this.face = -1;
      }
   
      /*
      * Applies a random number generator to set the die's face value
      */
      private void set(){
         this.face = 1 + seed.nextInt(6);
      }
   
      /*
      * returns the face value of the die
      */
      private Integer get(){
         return this.face;
      }
   }

}

