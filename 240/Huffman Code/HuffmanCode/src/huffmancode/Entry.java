package huffmancode;

/**
 *
 * @author Sean Batzel
 * @param <K>
 * @param <V>
 */
public class Entry<K, V> {

    public K key;
    public V value;
    public Entry next;

    public Entry(K key, V value) {
        this.key = key;
        this.value = value;
    }
}
