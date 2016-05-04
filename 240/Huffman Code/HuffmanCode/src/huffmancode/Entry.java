package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class Entry{
    char key;
    String value;
    Entry next;
    public Entry(char key, String value){
        this.key = key;
        this.value = value;
    }
}