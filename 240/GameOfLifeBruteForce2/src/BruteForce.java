
/**
 * Sean Batzel 3/31/2016.
 */

import batzel.life.gameoflife.GameOfLife;

public class BruteForce {

    static int best;
    static boolean[][] world;
    static boolean[][] now;
    static int realbest;
    static boolean[][] last;

    public static void main(String[] args) {
        for (int a = 0; a < 100; a++) {
            for (int i = 0; i < 1000000; i++) {
                world = new boolean[20][20];
                for (int x = 1; x < 19; x++) {
                    for (int y = 1; y < 19; y++) {
                        double check = Math.random();
                        world[x][y] = check < .5;
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
            if (realbest < best) {
                realbest = best;
                last = now;
            }
        }
        System.out.println("Best fitness found: ");
        System.out.println("    Survival rate of " + realbest);
        for (int i = 1; i < 19; i++) {
            for (int j = 1; j < 19; j++) {
                if (last[i][j]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.println();
        }
    }
}
