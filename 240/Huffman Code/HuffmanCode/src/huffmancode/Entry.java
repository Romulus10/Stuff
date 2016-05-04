package huffmancode;

/**
 *
 * @author Sean Batzel
 * @param <K>
 * @param <V>
 */
public class Entry<K,V>{
    char key;
    StringBuffer value;
    Entry next;
    public Entry(char key, StringBuffer value){
        this.key = key;
        this.value = value;
    }
}