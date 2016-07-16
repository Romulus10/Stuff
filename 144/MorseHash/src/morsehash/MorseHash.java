package morsehash;

import java.io.*;
import java.util.*;

/**
 * MorseHash class contains resources to translate to and from Morse Code.
 */
public class MorseHash {

    /**
     * Hash table to translate from Morse code
     */
    private Hashtable<String, String> morse2Sym;

    /**
     * Hash table to translate Morse code back to a symbol
     */
    private Hashtable<String, String> sym2Morse;

    /**
     * Constructor reads data file and constructs sym2Morse hash Use scanner or
     * other classes to read text file and extract the sym and morse code that
     * appear one per line separated by tab codes
     *
     * @param fileName
     * @throws java.io.IOException
     */
    public MorseHash(String fileName) throws IOException {
        this.sym2Morse = new Hashtable<String, String>();
        Scanner s = new Scanner(new File(fileName));
        String line = "this is just to make sure it isn't a null value going in to the loop";
        while (line != null && s.hasNext()) {
            line = s.nextLine();
            String splitLine[] = line.split("\\s+");
            this.sym2Morse.put(splitLine[0], splitLine[1]);
        }
    }

    /**
     * Construct the morse2Sym hash by using a for loop that goes through the
     * keys in the sym2Morse table and puts the reserve of the key symbol pairs
     * into the morse2Sym hashtable
     */
    public void makeReverseHash() {
        this.morse2Sym = new Hashtable<String, String>();
        char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        String alph[] = new String[36];
        for (int i = 0; i < alphabet.length; i++) {
            alph[i] = Character.toString(alphabet[i]);
        }
        for (String alph1 : alph) {
            String value = this.sym2Morse.get(alph1);
            //System.out.println(value);
            this.morse2Sym.put(value, alph1);
        }
    }

    public String verifyHash(Hashtable<String, String> h) {
        String answer = "";
        String[] Key = new String[h.size()];
        for (Enumeration<String> e = h.keys(); e.hasMoreElements();) {
            String key = e.nextElement();
            answer += key + "=" + h.get(key) + "\n";
        }
        return answer;
    }

    public String verifyEncoder() {
        return "\n\nEncoder Hash\n" + verifyHash(this.sym2Morse) + "\n\n";
    }

    public String verifyDecoder() {
        return "\n\nDecoder Hash\n" + verifyHash(this.morse2Sym) + "\n\n";
    }

    /**
     *
     * @param s
     * @return
     */
    public String translate(String s) {
        if (s.substring(0, 1).equals(".")
                || s.substring(0, 1).equals("-")) {
            return fromMorse(s);
        } else {
            return toMorse(s);
        }
    }

/**
 * Translate the message to morse code with the "/" symbol separating the codes
 *
 * @param message to be translated
 * @return
 */
public String toMorse(String message) {
        String Answer = "";
        for (int x = 0; x < message.length(); x++) {
            String text = Character.toString(message.charAt(x));
            if (text.equals(" ")) {
                Answer = Answer + " /";
            } else {
                Answer = Answer + this.sym2Morse.get(text) + "/";
            }
        }
        return Answer;
    }

    /**
     * Use the scanner class to pull apart the morse codes separated by the "/"
     * and translate the codes to the symbols
     *
     * @param message to be translated
     * @return
     */
    public String fromMorse(String message) {
        String Answer = "";
        Scanner s = new Scanner(message).useDelimiter("/");
        while (s.hasNext()) {
            // Complete the method
            String text = s.next();
            if (" ".equals(text)) {
                Answer = Answer + " ";
            } else {
                Answer = Answer + this.morse2Sym.get(text);
            }
        }
        return Answer;
    }
}
