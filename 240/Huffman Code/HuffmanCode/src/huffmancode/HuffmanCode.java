package huffmancode;

/**
 *
 * @author Sean Batzel I was having an issue where Dictionary.get() was not
 * retrieving "space" characters correctly. I dealt with it by having the
 * program substitute underscores for spaces, encoding the string that way. A
 * decoder would need to account for spaces being represented as underscores.
 */
public class HuffmanCode {

    private static Dictionary<Character, String> hash;

    public static HuffmanTree buildTree(int[] letters) {
        DoubleArrayWrapper iHopeThisWorks = BubbleSort.bubbleSort(letters);
        Queue<HuffmanTree> trees = new Queue<>();
        try {
            for (int i = 0; i < letters.length; i++) {
                if (letters[i] > 0) {
                    trees.enqueue(new HuffmanLeaf(iHopeThisWorks.getA()[i], iHopeThisWorks.getB()[i]));
                    //trees.enqueue(new HuffmanLeaf(letters[i], (char) i));
                }
            }
            while (trees.size() > 1) {
                HuffmanTree a = trees.dequeue();
                HuffmanTree b = trees.dequeue();
                trees.enqueue(new HuffmanNode(a, b));
            }
            return trees.dequeue();
        } catch (NullPointerException e) {
            return null;
        }
    }

    public static void printCodes(HuffmanTree tree, StringBuffer stuff) {
        if (tree instanceof HuffmanLeaf) {
            HuffmanLeaf leaf = (HuffmanLeaf) tree;
            System.out.println(leaf.value + "\t" + leaf.frequency + "\t\t" + stuff);
            String intermediate = stuff.toString();
            intermediate = StringUtilities.removeLeadingZeros(intermediate);
            hash.add(leaf.value, intermediate);
        } else if (tree instanceof HuffmanNode) {
            HuffmanNode node = (HuffmanNode) tree;
            stuff.append('0');
            printCodes(node.left, stuff);
            stuff.deleteCharAt(stuff.length() - 1);
            stuff.append('1');
            printCodes(node.right, stuff);
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
            System.out.print("\n");
            String input = fixed;
            int[] letters = new int[256];
            for (char c : input.toCharArray()) {
                letters[c]++;
            }
            HuffmanTree tree = buildTree(letters);
            System.out.println("SYMBOL\tFREQUENCY\tHUFFMAN CODE");
            printCodes(tree, new StringBuffer());
            System.out.print("\n");
            StringBuilder output = new StringBuilder();
            System.out.println("Original: ");
            for (int i = 0; i < input.length(); i++) {
                if (input.charAt(i) == '_') {
                    System.out.print(" ");
                } else {
                    System.out.print(input.charAt(i));
                }
            }
            System.out.print("\n");
            System.out.println("Size: " + input.length() * 8 + " bits.");
            System.out.print("\n");
            System.out.println("Encoded: ");
            for (char c : input.toCharArray()) {
                String as = hash.get(c);
                System.out.print(as + " ");
                output.append(as);
            }
            System.out.print("\n");
            output.toString();
            System.out.println("Binary String Length: " + output.length() + " bits.");
            System.out.print("\n");
        }
    }
}
