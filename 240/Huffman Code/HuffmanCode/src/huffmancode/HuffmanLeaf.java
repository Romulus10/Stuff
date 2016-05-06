package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class HuffmanLeaf extends HuffmanTree {

    public final char value;

    public HuffmanLeaf(int frequency, char value) {
        super(frequency);
        this.value = value;
    }
}
