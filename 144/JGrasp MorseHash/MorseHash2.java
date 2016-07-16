   import java.io.*;
   import java.util.*;

/**
* MorseHash class contains resources to translate to and from Morse Code.
*/
    public class MorseHash2 {
   
    /**
    * Hashtable to translate from Morse code
    */
      private Hashtable<String, String> morse2Sym;
   
    /**
    * Hashtable to translate morse code back to a symbol
    */
      private Hashtable<String, String> sym2Morse;
   	
   	/**
   	* Constructor reads data file and constructs sym2Morse hash
   	* Use scanner or other classes to read text file and extract the symbol and morse code
   	* that appear one per line separated by tab codes
   	* @param Name of more code file
   	*/
       public MorseHash2(String fileName) throws IOException {
         this.sym2Morse = new Hashtable<String, String>();
         Scanner s = new Scanner(new File(fileName));
        
       String line = null;
         
         while(s.hasNextLine()){
        	 line = s.nextLine();
        	 String[] splitLine = line.split("\\s+");
        	 this.sym2Morse.put(splitLine[0], splitLine[1]);
        	
         	}
         s.close();
         
         }
      
   	/**
   	* Construct the morse2Sym hash by using a for loop that
		* goes through the keys in the sym2Morse table
		* and puts the reserve of the key symbol pairs into the
		* morse2Sym hashtable
   	*/
       public void makeReverseHash(){
       
    	   this.morse2Sym = new Hashtable<String, String>();
    	   Set<String> keys = sym2Morse.keySet();
    	   
    	   for(String key: keys){
    		   morse2Sym.put(sym2Morse.get(key), key);  
    	   }

      }
   
       public String verifyHash(Hashtable<String, String> h){
         String answer = "";
         String[] Key = new String[h.size()];
         for(Enumeration<String> e = h.keys(); e.hasMoreElements(); ){
            String key = e.nextElement();
            answer+=key+"="+h.get(key)+"\n";
         }
         return answer;
      }
   
       public String verifyEncoder(){
         return "\n\nEncoder Hash\n"+verifyHash(this.sym2Morse)+"\n\n";
      }
   
       public String verifyDecoder(){
         return "\n\nDecoder Hash\n"+verifyHash(this.morse2Sym)+"\n\n";
      }
   	
       public String translate(String s){
         if(s.substring(0,1).equals(".") ||
         	s.substring(0,1).equals("-"))
            return fromMorse(s);
         else
            return toMorse(s);
      }
   
   	/**
   	* Translate the message to morse code with the "/" symbol
		* separating the codes
   	* @param message to be translated
   	*/
       public String toMorse(String message){
         String Answer = "";
         // Complete the method

         String[] splitMessage = message.split("\\s+");
         
         for(int i =0; i < splitMessage.length; i++){
        	 
        	 String[] splitChar = splitMessage[i].split("");
        	 String tempAnswer = " /";
        	 for(int j = 0; j< splitChar.length; j++){
        		 
        		 tempAnswer+= sym2Morse.get(splitChar[j]) + "/"; 
        	 }
        	 
        	 Answer += tempAnswer;
         }
         
         return Answer;
      }
   	
   	/**
   	* Use the scanner class to pull apart the morse codes separated
		* by the "/" and translate the codes to the symbols
   	* @param message to be translated
   	*/
       public String fromMorse(String message){
         String Answer = "";
         Scanner s = new Scanner(message).useDelimiter("/");
         while(s.hasNext()){
        	 String temp = s.next();
        	 if (morse2Sym.get(temp) == null){
        		 Answer += " ";
        	 }else{ 
        		 Answer += morse2Sym.get(temp);
        	 }
      }
        s.close();
        
		return Answer;
   	
   }
    }
