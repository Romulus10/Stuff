/*
 Name: Sean Batzel

 Who did you help?
 Zack Black

 How did you help them?
 Provided pointers on Java syntax and more involved structures.

 Who helped you?


 How were you helped?


 Changes from previous version:
 Reworked original code to provide for solutions to the following bugs:
 Letters throw an NumberFormatException when psased through the Integer typecasting, which causes the game to crash.
 */

import java.util.*;
import javax.swing.*;

public class HiLoGame {

    public static void HiLo() {
        Random r = new Random();
        int Lo = 1;
        int Hi = 100;
        int Target = r.nextInt(Hi - Lo + 1) + 1; // Picks a numner from 1 to 100.
        System.out.println(Target);
        int NoOfGuesses = 0;
        int Guess = -1;
        String Title = "Hi Lo Game";
        String data = JOptionPane.showInputDialog(null, "The number is between " + Lo + " and " + Hi + "\nMake your guess.", Title, 1);
        Guess = new Integer(data);
        while ((Guess != Target) && (NoOfGuesses != 8)) {
            if (Guess != Target) {
                if (Guess < Lo) {
                    JOptionPane.showMessageDialog(null, "Try again, the number is between " + Lo + "and " + Hi + ".");
                } else if (Guess > Hi) {
                    JOptionPane.showMessageDialog(null, "Try again, the number is between " + Lo + "and " + Hi + ".");
                } else if (Guess < Target) {
                    JOptionPane.showMessageDialog(null, "You guessed too low.");
                } else if (Guess > Target) {
                    JOptionPane.showMessageDialog(null, "You guessed too high.");
                } else {
                    JOptionPane.showMessageDialog(null, "Guess invalid.");
                }
            }
            NoOfGuesses++;
            data = JOptionPane.showInputDialog(null, "The number is between " + Lo + " and " + Hi + "\nMake your guess.", Title, 1);
            Guess = new Integer(data);
        }
        if (Guess == Target) {
            JOptionPane.showMessageDialog(null, "Perfect! You got it.");
        } else {
            JOptionPane.showMessageDialog(null, "Didn't quite get it. Try again!", "Oh no!", 1);
        }
    }

    public static void main(String argv[]) {
        String[] commands = {
            "Play Hi Lo",
            "Exit"
        };
        int choice = -1;
        String Title = "Play The Hi Lo Game";
        choice = JOptionPane.showOptionDialog(
                null,
                "Do you want to play Hi Lo against the computer?",
                Title,
                JOptionPane.YES_NO_CANCEL_OPTION,
                JOptionPane.QUESTION_MESSAGE,
                null,
                commands,
                commands[commands.length - 1]
        );
        while (choice != commands.length - 1) {
            HiLo();
            choice = JOptionPane.showOptionDialog(
                    null,
                    "Do you want to play Hi Lo against the computer?",
                    Title,
                    JOptionPane.YES_NO_CANCEL_OPTION,
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    commands,
                    commands[commands.length - 1]
            );
        }
    }

}
