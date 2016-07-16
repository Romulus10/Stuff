package randomgaptest;

import java.util.*;

/*
 Sean Batzel

 Who did you help?


 How did you help them?


 Who helped you?


 How did they help you


 */
public class RandomGapTest {

    private Integer range;
    private Random rand;
    private Integer[] Uniform;
    ArrayList<Integer> numbers;

// Add attribute(s) to collect gap test data
    ArrayList<Integer> Gap;
    int[] lastTime;

    /*
     * RandomGapTest Constructor
     */
    public RandomGapTest(Integer range) {
        this.range = range;
        Gap = new ArrayList<>();
        numbers = new ArrayList<>();
        lastTime = new int[range];
        for (int i = 0; i < range; i++) {
            lastTime[i] = 0;
        }
        rand = new Random();
    }

    public void RunTest(Integer Num) {
        for (int i = 0; i < Num; i++) {
            int y = rand.nextInt(range);
            numbers.add(y);
            if (lastTime[y] == -1) {
                lastTime[y] = i;
                break;
            }
            int result = i - lastTime[y];
            /*
             if (result == 0)
             {
             System.out.println("0 gap occurred. " + y + " " + i + " " + result + " " + lastTime[y]);
             }
             */
            lastTime[y] = i;
            //int x = Gap.get(result);
            if (result < range) {
                try {
                    int x = Gap.get(result);
                    Gap.set(result, (x + 1));
                } catch (Exception e) {
                    while (Gap.size() < (result + 1) && Gap.size() < range) {
                        Gap.add(0);
                    }
                    int x = Gap.get(result);
                    Gap.set(result, (x + 1));
                }
            } else {
                int x = Gap.get(0);
                Gap.set(0, x + 1);
            }
        }
        //System.out.println(numbers);
        //System.out.println(Gap);
    }

    public ArrayList<Integer> GetGapData() {
        return this.Gap;
    }
}
