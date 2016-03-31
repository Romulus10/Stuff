/**
 * Sean Batzel 3/31/2016.
 */

import batzel.life.gameoflife.GameOfLife;

public class BruteForce {

    static int best;
    static boolean[][] world;
    static boolean[][] now;

    public static void main(String[] args) {
        for (int a = 0; a < 100; a++) {
            for (int i = 0; i < 1000000; i++) {
                world = new boolean[20][20];
                for (int x = 1; x < 19; x++) {
                    for (int y = 1; y < 19; y++) {
                        double check = Math.random();
                        if (check < .5) world[x][y] = true;
                        else world[x][y] = false;
                    }
                }
                GameOfLife game = new GameOfLife(world);
                for (int j = 0; j < 1000; j++) {
                    game.theGameOfLife();
                }
                int current = game.findSurvivalRate();
                if (current > best) {
                    best = current;
                    now = world;
                }
            }
            System.out.println("Best fitness found: ");
            System.out.println("    Survival rate of " + best);
            for (int i = 1; i < 19; i++) {
                for (int j = 1; j < 19; j++) {
                    if (now[i][j]) System.out.print("X ");
                    else System.out.print("o ");
                }
                System.out.println();
            }
        }
    }
}
