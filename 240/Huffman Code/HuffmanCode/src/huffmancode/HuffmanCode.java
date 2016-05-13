package huffmancode;

import java.util.PriorityQueue;

/**
 *
 * @author Sean Batzel 
 * 
 * Resubmission
 * 
 * I was having an issue where Dictionary.get() was not
 * retrieving "space" characters correctly. I dealt with it by having the
 * program substitute underscores for spaces, encoding the string that way. A
 * decoder would need to account for spaces being represented as underscores. As
 * of 5/5/2016 at 21:40, this works correctly, but not with an optimal Huffman
 * tree.
 * It's now 23:50, still not optimal.
 * Very not optimal.
 * 
 * Update - My initial research into this problem seemed to indicate that a
 * priority queue was the best way to go for actually building the tree.
 * It just occurred to me that my implementation of the queue was *not* 
 * prioritized. That should solve the problem.
 */
public class HuffmanCode {

    private static Dictionary<Character, String> hash;

    public static HuffmanTree buildTree(int[] letters) {
        PriorityQueue<HuffmanTree> q = new PriorityQueue<>();
        for (int i = 0; i < letters.length; i++) {
            if (letters[i] > 0) {
                q.offer(new HuffmanLeaf(letters[i], ((char) i)));
            }
        }
        assert q.size() > 0;
        while (q.size() > 1) {
            HuffmanTree one = q.poll();
            HuffmanTree two = q.poll();
            q.offer(new HuffmanNode(one, two));
        }
        return q.poll();
    }

    public static void displayTree(HuffmanTree tree, StringBuffer stuff) {
        assert tree != null;
        if (tree instanceof HuffmanLeaf) {
            HuffmanLeaf leaf = (HuffmanLeaf) tree;
            print(leaf.value + "\t" + leaf.frequency + "\t\t" + stuff);
            String intermediate = stuff.toString();
            intermediate = StringUtilities.removeLeadingZeros(intermediate);
            hash.add(leaf.value, intermediate);
        } else if (tree instanceof HuffmanNode) {
            HuffmanNode node = (HuffmanNode) tree;
            stuff.append('0');
            displayTree(node.left, stuff);
            stuff.deleteCharAt(stuff.length() - 1);
            stuff.append('1');
            displayTree(node.right, stuff);
            stuff.deleteCharAt(stuff.length() - 1);
        }
    }

    public static void main(String[] args) {
        String[] strings = {"just as fire tempers iron into fine steel so does adversity temper ones character into firmness tolerance and determination", "someone is sitting in the shade today because someone planted a tree a long time ago"};
        for (String x : strings) {
            char[] z = x.toCharArray();
            for (int y = 0; y < z.length; y++) {
                if (z[y] == ' ') {
                    z[y] = '_';
                }
            }
            StringBuilder wait = new StringBuilder();
            for (int i = 0; i < z.length; i++) {
                wait.append(z[i]);
            }
            String fixed = wait.toString();
            hash = new Dictionary();
            putchar("\n");
            String input = fixed;
            int[] letters = new int[256];
            for (char c : input.toCharArray()) {
                letters[c]++;
            }
            HuffmanTree tree = buildTree(letters);
            print("SYMBOL\tFREQUENCY\tHUFFMAN CODE");
            displayTree(tree, new StringBuffer());
            putchar("\n");
            StringBuilder output = new StringBuilder();
            print("Original: ");
            for (int i = 0; i < input.length(); i++) {
                if (input.charAt(i) == '_') {
                    putchar(" ");
                } else {
                    putchar(input.charAt(i));
                }
            }
            putchar("\n");
            print("Size: " + (input.length() * 8) + " bits.");
            putchar("\n");
            print("Encoded: ");
            for (char c : input.toCharArray()) {
                String as = hash.get(c);
                putchar(as + " ");
                output.append(as);
            }
            putchar("\n");
            output.toString();
            print("Binary String Length: " + output.length() + " bits.");
            putchar("\n");
        }
    }

    public static void print(String x) {
        System.out.println(x);
    }

    public static void putchar(String x) {
        System.out.print(x);
    }

    public static void putchar(char x) {
        System.out.print(x);
    }
}
