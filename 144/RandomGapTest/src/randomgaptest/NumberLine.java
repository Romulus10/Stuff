package numberline;

import java.util.Scanner;

public class NumberLine {

    private static final Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        int lower = getIntFromUser("Enter the lower bound:");
        int upper = getIntFromUser("Enter the upper bound:");
        int digit = (int) (Math.log(((double) (upper) + 1)));
        for (int i = lower; i < upper; i++) {
            for (int j = digit; j > 0; j--) {
                System.out.print(getDigit(i, j) + " ");
            }
            System.out.println();
        }
    }

    private static int getIntFromUser(String prompt) {
        System.out.println(prompt);
        return sc.nextInt();
    }

    private static int getDigit(int number, int place) {
        return ((number % (10 * place)) / place);
    }

}
