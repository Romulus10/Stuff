package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class HuffmanNode extends HuffmanTree {

    public final HuffmanTree left, right;

    public HuffmanNode(HuffmanTree left, HuffmanTree right) {
        super(left.frequency + right.frequency);
        this.left = left;
        this.right = right;
    }
}
