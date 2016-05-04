package huffmancode;

/**
 *
 * @author Sean Batzel
 * @param <T>
 */
public class Node<T> {

    public T value;
    public Node<T> ref;

    public Node() {
        this.ref = null;
    }
}
