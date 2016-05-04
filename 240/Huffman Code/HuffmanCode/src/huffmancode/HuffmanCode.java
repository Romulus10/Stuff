package huffmancode;

// Sean Batzel
// I spent quite a bit of time researching how to get these to work. 
// A binary search tree is *not* going to work. We need something a little more dynamic than that.
/**
 *
 * @author Sean Batzel
 */
public class HuffmanCode {

    private static Dictionary hash;

    public static HuffmanTree buildTree(int[] letters) {
        //System.out.println("Buildin' a tree, buildin' a tree...");
        Queue<HuffmanTree> trees = new Queue<>();
        //System.out.println("Look ma, I made a queue!");
        //System.out.println(letters.length);
        try {
            for (int i = 0; i < letters.length; i++) {
            //System.out.println("looping");
                //System.out.println(i);
                if (letters[i] > 0) {
                    //System.out.println("GASP! NEW LEAF!");
                    trees.enqueue(new HuffmanLeaf(letters[i], (char) i));
                    //trees.look();
                }
            }
            while (trees.size() > 1) {
                HuffmanTree a = trees.dequeue();
                HuffmanTree b = trees.dequeue();
                trees.enqueue(new HuffmanNode(a, b));
            }
            return trees.dequeue(); //We can just look at the front of the queue like this.
        } catch (NullPointerException e) {
            return null;
        }
    }

    public static void printCodes(HuffmanTree tree, StringBuffer stuff) {
        /**
         * If I just use a String instead of a StringBuffer, I need to create a
         * new string out of two concatenated strings every time I want to
         * change the existing string. This is really very convenient actually.
         */
        if (tree instanceof HuffmanLeaf) {
            HuffmanLeaf leaf = (HuffmanLeaf) tree;
            System.out.println(leaf.value + "\t" + leaf.frequency + "\t\t" + stuff);
            // Okay. We know for a fact that leaf.value and stuff are the right values. Why aren't they making it to the dictionary?
            String intermediate = stuff.toString();
            //intermediate = intermediate.replaceFirst("^0+(?!$)", "");
            //intermediate = StringUtilities.removeLeadingZeros(intermediate);
            hash.add(leaf.value, intermediate);
            //System.out.println(leaf.value + " " + stuff);
            //hash.printMap();
        } else if (tree instanceof HuffmanNode) { // Why did I never know instanceof was an actual keyword??? This is great!
            HuffmanNode node = (HuffmanNode) tree; // Starting node traversal.
            stuff.append('0');
            printCodes(node.left, stuff);
            //stuff.append('0');
            stuff.deleteCharAt(stuff.length() - 1); //Alright if I don't clean up the strings we end up with way too many 0's.
            stuff.append('1');
            printCodes(node.right, stuff);
            stuff.deleteCharAt(stuff.length() - 1);
        }
    }

    public static void main(String[] args) {
        String[] strings = {"The quick brown fox jumped over the lazy dog."};
        for (String x : strings) {
            hash = new Dictionary();
            System.out.print("\n");
            String input = x;
            int[] letters = new int[256]; //Satisfies the "any string less than 256 characters" requirement.
            for (char c : input.toCharArray()) {
                letters[c]++;
            }
            //System.out.println("about to build a tree yo");
            HuffmanTree tree = buildTree(letters);
            System.out.println("SYMBOL\tFREQUENCY\tHUFFMAN CODE");
            printCodes(tree, new StringBuffer());
            System.out.print("\n");
            //System.out.println("I would while away the hours, confirmin' with the flowers, consultin' with the rain...");
            //hash.printMap();
            //System.out.print("\n");
            //System.out.println("In my head, I'd be scratchin' while my thoughts were busy hatchin' if I only had a brain!");
            StringBuilder output = new StringBuilder();
            for (char c : input.toCharArray()) {
                //System.out.println("Sit dooooooooooooooooooown");
                output.append(hash.get(c));
            }
            output.toString();
            System.out.println("Original: ");
            System.out.println(x);
            System.out.print("\n");
            System.out.println("Encoded: ");
            System.out.println(output);
            //System.out.println("I dreamed last night I got on the boat to heaven, and by some chance I had brought my dice along!");
            System.out.print("\n");
        }
    }
}
