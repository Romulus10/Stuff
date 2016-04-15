package testers;

import batzel.life.gameoflife.GameOfLife;

/**
 * Sean Batzel
 * 
* Completely random aggressive mutation method Test for - Increasing fitness
 * Termination Condition - Iterations WITHOUT increase of fitness.
 */
public class SmartSolver {

    static float startcells;
    static boolean[][] world;
    static boolean[][] now;
    static float best;
    static float bestIteration;

    public static void main(String args[]) {
        best = 0;
        int k = 0;
        int noChange = 0;
        while (noChange < 10000000) {
            world = new boolean[20][20];
            world = makeworld();
            GameOfLife game = new GameOfLife(world, 20, 20);
            startcells = game.findSurvivalRate();
            if (startcells < 4) {
                continue;
            }
            for (int j = 0; j < 1000; j++) {
                game.theGameOfLife();
            }
            float current = (game.findSurvivalRate() / (2 * startcells));
            if (current > best) {
                best = current;
                now = world;
                bestIteration = k;
                System.out.printf("Iteration %d: Fitness %f\n", k, best);
                noChange = 0;
            } else {
                noChange++;
            }
            if (noChange > 10000000) {
                die("LOOP CONDITION MET");
            }
            k++;
        }
        System.out.println("Best fitness found: ");
        System.out.printf("\tIteration %f: Fitness %f\n", bestIteration, best);
        for (int i = 1; i < 19; i++) {
            for (int j = 1; j < 19; j++) {
                if (now[i][j]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.println();
        }
    }

    public static void die(String arg) {
        System.err.printf("%s\n", arg);
        System.exit(0);
    }

    public static boolean[][] makeworld() {
        boolean[][] retur = new boolean[20][20];
        for (int x = 1; x < 19; x++) {
            for (int y = 1; y < 19; y++) {
                double check = Math.random();
                retur[x][y] = check < .5;
            }
        }
        return retur;
    }
}
