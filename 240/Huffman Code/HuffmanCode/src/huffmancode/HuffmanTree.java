package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public abstract class HuffmanTree implements Comparable<HuffmanTree> {

    public final int frequency;

    public HuffmanTree(int freq) {
        frequency = freq;
    }

    @Override
    public int compareTo(HuffmanTree tree) {
        return frequency - tree.frequency;
    }
}
