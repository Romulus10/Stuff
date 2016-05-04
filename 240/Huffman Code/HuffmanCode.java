// Sean Batzel
// Huffman Code
// I spent quite a bit of time researching how to get these to work. 
// The entire internet suggests a priority queue for this. Time to learn how those work in this language.
// A binary search tree is *not* going to work. We need something a little more dynamic than that.

import java.util.*;
 
abstract class HuffmanTree implements Comparable<HuffmanTree> { // Abstract classes can be extended, but not instantiated? Alright.
    public final int frequency;
    public HuffmanTree(int freq) {
		frequency = freq; 
	}
    public int compareTo(HuffmanTree tree) {
        return frequency - tree.frequency;
    } // Okay in order to use any kind of JVM-provided collection, this needs to implement Comparable apparently.
}
 
class HuffmanLeaf extends HuffmanTree {
    public final char value;
    public HuffmanLeaf(int freq, char val) {
        super(freq);
        value = val;
    }
}
 
class HuffmanNode extends HuffmanTree {
    public final HuffmanTree left, right;
    public HuffmanNode(HuffmanTree l, HuffmanTree r) {
        super(l.frequency + r.frequency);
        left = l;
        right = r;
    }
}
 
public class HuffmanCode {
	
	private static HashMap hash;
	
    public static HuffmanTree buildTree(int[] letters) {
        Queue<HuffmanTree> trees = new Queue<HuffmanTree>();
        for (int i = 0; i < letters.length; i++){
            if (letters[i] > 0){
                trees.enqueue(new HuffmanLeaf(letters[i], (char)i));
			}
		}
        while (trees.size() > 1) {
            HuffmanTree a = trees.look();
            HuffmanTree b = trees.look();
            trees.enqueue(new HuffmanNode(a, b));
        }
        return trees.look(); //We can just look at the front of the queue like this.
    }
 
    public static void printCodes(HuffmanTree tree, StringBuffer stuff) {
		/**
			If I just use a String instead of a StringBuffer,
			I need to create a new string out of two concatenated strings
			every time I want to change the existing string. This is
			really very convenient actually.
		*/
		hash = new HashMap<String, Object>();
        if (tree instanceof HuffmanLeaf) {
            HuffmanLeaf leaf = (HuffmanLeaf)tree;
            System.out.println(leaf.value + "\t" + leaf.frequency + "\t" + stuff);
	    hash.put(leaf.value, stuff);
        } else if (tree instanceof HuffmanNode) { // Why did I never know instanceof was an actual keyword??? This is great!
            HuffmanNode node = (HuffmanNode)tree;
            stuff.append('0');
            printCodes(node.left, stuff);
            stuff.deleteCharAt(stuff.length()-1); //Alright if I don't clean up the strings we end up with way too many 0's.
            stuff.append('1');
            printCodes(node.right, stuff);
            stuff.deleteCharAt(stuff.length()-1);
        }
    }
 
    public static void main(String[] args) {
        for (String x : args){
			System.out.print("\n");
			String input = x;
			int[] letters = new int[256]; //Satisfies the "any string less than 256 characters" requirement.
			for (char c : input.toCharArray()){
				letters[c]++;
			}
			HuffmanTree tree = buildTree(letters);
			System.out.println("SYMBOL\tWEIGHT\tHUFFMAN CODE");
			printCodes(tree, new StringBuffer());
			System.out.print("\n");
			printMap(hash);
			for (char c : input.toCharArray()){
				System.out.print(hash.get(c));
			}
			System.out.print("\n");
		}
    }

public static void printMap(Map mp) {
    Iterator it = mp.entrySet().iterator();
    System.out.println(mp.size());
    while (it.hasNext()) {
        Map.Entry pair = (Map.Entry)it.next();
        System.out.println(pair.getKey() + " = " + pair.getValue());
        it.remove(); // avoids a ConcurrentModificationException
    }
}
}

class Node<T> {
    public T value;
    public Node<T> ref;

    public Node() {
        this.ref = null;
    }
}

class Queue<T>{

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

    public void dumpQueue() {
        // Print the entire queue on one line, left to right.
        // O(n) running time.
        Node<T> next = head.ref;
        while (next != null) {
            System.out.print(next.value + " ");
            next = next.ref;
        }
        System.out.println();
    }
	
	public T look(){
		return head.ref.value;
	}
	
	public int size(){
		return size;
	}
}
