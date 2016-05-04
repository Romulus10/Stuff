package huffmancode;

/**
 *
 * @author Sean Batzel
 */
public class Dictionary {

    Entry head;
    Entry current;

    public Dictionary() {
        head = new Entry(' ', null);
        current = head;
    }

    public void add(char key, String value) {
        current.next = new Entry(key, value);
        current = current.next;
    }

    public String get(char key) {
        //System.out.println(key);
        Entry tmp = head;
        String value = null;
        while (tmp.key != key) {
            tmp = tmp.next;
            try {
                if (tmp.key == key) {
                    break;
                }
            } catch (NullPointerException e) {
                break;
            }
        }
        try{
            value = tmp.value;
        }
        catch(NullPointerException e){
            //Don't do diddly squat.
        }
        if(value != null){
        return value;
        }
        else{
            value = "";
            return value;
        }
    }

    public void printMap() {
        //System.out.println("Made it.");
        //System.out.println("Someday I'll wish upon a star and wake up where the clouds are far behiiiiiiiiiiiind me");
        Entry tmp = head.next;
        while (tmp.next != null) {
            System.out.println(tmp.key + ": " + tmp.value);
            tmp = tmp.next;
        }
        System.out.println(tmp.key + ": " + tmp.value);
        //System.out.println("Something has changed within me... Something is not the same...");
    }
}
