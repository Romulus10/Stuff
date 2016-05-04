package huffmancode;

/**
 *
 * @author Sean Batzel
 * @param <T>
 */
public class Queue<T> {

    private Node<T> head; // Current front of the queue.
    private Node<T> current; // The node we're currently adding to the end.
    private int size; //Number of elements in the queue.

    public void enqueue(T val) {
        // Add a new node to the end of the queue.
        // O(1) running time.
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
        // Remove and return the value at the front of the queue.
        // O(1) running time.
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
        try{
            return head.ref.value;
        }
        catch (NullPointerException e){
            return null;
        }
    }

    public int size() {
        return size;
    }
}
