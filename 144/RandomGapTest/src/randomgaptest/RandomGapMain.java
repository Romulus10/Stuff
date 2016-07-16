package randomgaptest;

import java.io.*;
import java.util.*;

public class RandomGapMain {

    public static void main(String[] arg) throws IOException {

        Integer range = 20;
        RandomGapTest Test = new RandomGapTest(range);

        Test.RunTest(5000);
        ArrayList<Integer> Gap = Test.GetGapData();
        for (int i = 0; i < Gap.size(); i++) {
            System.out.println(i + "\t" + Gap.get(i));
        }
    }
}
