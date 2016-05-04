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
 
public class RosettaCodeHuffman {
    public static HuffmanTree buildTree(int[] letters) {
        PriorityQueue<HuffmanTree> trees = new PriorityQueue<HuffmanTree>();
        for (int i = 0; i < letters.length; i++){
            if (letters[i] > 0){
                trees.offer(new HuffmanLeaf(letters[i], (char)i));
			}
		}
        while (trees.size() > 1) {
            HuffmanTree a = trees.poll();
            HuffmanTree b = trees.poll();
            trees.offer(new HuffmanNode(a, b));
        }
        return trees.poll(); //We can just peek at the front of the queue like this.
    }
 
    public static void printCodes(HuffmanTree tree, StringBuffer stuff) {
		/**
			If I just use a String instead of a StringBuffer,
			I need to create a new string out of two concatenated strings
			every time I want to change the existing string. This is
			really very convenient actually.
		*/
        if (tree instanceof HuffmanLeaf) {
            HuffmanLeaf leaf = (HuffmanLeaf)tree;
            System.out.println(leaf.value + "\t" + leaf.frequency + "\t" + stuff);
 
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
		}
    }
}
