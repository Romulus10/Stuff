/**
 * Created by Sean Batzel on 2/6/2016.
 */
public interface StackInterface<T> {
    public void push(T val);
    public T pop();
    public void dumpstack();
}
