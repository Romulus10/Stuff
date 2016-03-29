/**
 * Sean Batzel 2/14/2016.
 */

package queueimplementation;

public class Node<T> {
    public T value;
    public Node<T> ref;

    public Node() {
        this.ref = null;
    }
}
