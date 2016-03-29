/**
 * Created by Sean Batzel on 2/6/2016.
 */
public class Stack<T> implements StackInterface<T>{
    private int size;
    private Node<T> lastIn;
    public void push(T val){
        if(size==0){
            lastIn = new Node<T>();
            lastIn.val = val;
            lastIn.ref = null;
            size++;
        }
        else{
            Node save = lastIn;
            lastIn = new Node<T>();
            lastIn.val = val;
            lastIn.ref = save;
            size++;
        }
    }
    public T pop(){
        T value;
        if (lastIn != null) {
            value = lastIn.val;
            lastIn = lastIn.ref;
        }
        else{
            return null;
        }
        return value;
    }
    public void dumpstack(){
        Node current = lastIn;
        while (current != null){
            System.out.println(current.val);
            current = current.ref;
        }
    }
}
