package huffmancode;

/**
 *
 * @author Sean Batzel
 * @param <T>
 */
public class Queue<T> {

    private Node<T> head;
    private Node<T> current;
    private int size;

    public void enqueue(T val) {
        if (size == 0) {
            head = new Node<>();
            current = new Node<>();
            head.ref = current;
            current.value = val;
            size++;
        } else {
            Node<T> temp = new Node<>();
            current.ref = temp;
            current = temp;
            current.value = val;
            size++;
        }
    }

    public T dequeue() {
        if (size != 0) {
            Node<T> temp;
            T tempVal;
            temp = head.ref;
            tempVal = temp.value;
            head = head.ref;
            size--;
            return tempVal;
        } else {
            return null;
        }
    }

    public T look() {
        try {
            return head.ref.value;
        } catch (NullPointerException e) {
            return null;
        }
    }

    public int size() {
        return size;
    }
}
