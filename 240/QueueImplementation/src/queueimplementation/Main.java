/**
 * Sean Batzel 2/14/2016.
 */

package queueimplementation;

public class Main {
    public static void main(String args[]) {
        Queue<Integer> queue;
        queue = new Queue<>();
        queue.enqueue(2);
        queue.dumpQueue();
        queue.enqueue(1);
        queue.dumpQueue();
        queue.enqueue(3);
        queue.dumpQueue();
        queue.enqueue(10);
        queue.dumpQueue();
        queue.dequeue();
        queue.dumpQueue();
        queue.enqueue(15);
        queue.dumpQueue();
        queue.dequeue();
        queue.dumpQueue();
        queue.dequeue();
        queue.dumpQueue();
        queue.dequeue();
        queue.dumpQueue();
        queue.dequeue();
        queue.dequeue();
        queue.dumpQueue();
        queue.dequeue();
        queue.dumpQueue();
        queue.dequeue();
    }
}
