package huffmancode;

/**
 *
 * @author Sean Batzel
 * @param <K>
 * @param <V>
 */
public class Dictionary<K, V> {

    Entry head;
    Entry current;

    public Dictionary() {
        head = new Entry(' ', null);
        current = head;
    }

    public void add(K key, V value) {
        current.next = new Entry(key, value);
        current = current.next;
    }

    public V get(K key) {
        //System.out.println(key);
        Entry tmp = head;
        V value = null;
        while (tmp.key != key) {
            tmp = tmp.next;
            try {
                if (tmp.key == key) {
                    break;
                }
            } catch (NullPointerException e) {
                break;
            }
        }
        try {
            value = (V) tmp.value;
        } catch (NullPointerException e) {
        }
        if (value != null) {
            return value;
        } else {
            value = (V) "";
            return value;
        }
    }

    public void printMap() {
        Entry tmp = head.next;
        while (tmp.next != null) {
            System.out.println(tmp.key + ": " + tmp.value);
            tmp = tmp.next;
        }
        System.out.println(tmp.key + ": " + tmp.value);
    }
}
