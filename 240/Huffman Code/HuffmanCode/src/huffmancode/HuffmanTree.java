package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public abstract class HuffmanTree implements Comparable<HuffmanTree> { // Abstract classes can be extended, but not instantiated? Alright.

    public final int frequency;

    public HuffmanTree(int freq) {
        frequency = freq;
    }

    @Override
    public int compareTo(HuffmanTree tree) {
        return frequency - tree.frequency;
    } // Okay in order to use any kind of JVM-provided collection, this needs to implement Comparable apparently.
}
