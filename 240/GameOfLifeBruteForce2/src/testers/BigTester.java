package testers;


/**
 * Sean Batzel 4/4/2016.
 *
 * A testing program to run the main brute force class repeatedly and determine
 * what the most optimal result *should* be.
 *
 */
import batzel.life.gameoflife.GameOfLife;

public class BigTester {

    static float best;
    static boolean[][] world;
    static boolean[][] now;
    static float[] startcells;
    static int bestIteration;

    public static void main(String[] args) {
        int one = 1000;
        float[] three = new float[one];
        for (int two = 0; two < one; two++) {
            best = 0;
            startcells = new float[100];
            for (int i = 0; i < 100; i++) {
                world = new boolean[20][20];
                world = makeworld();
                GameOfLife game = new GameOfLife(world, 20, 20);
                startcells[i] = game.findSurvivalRate();
                if (startcells[i] < 4) {
                    continue;
                }
                for (int j = 0; j < 1000; j++) {
                    game.theGameOfLife();
                }
                float current = (game.findSurvivalRate() / (2 * startcells[i]));
                if (current > best) {
                    best = current;
                    now = world;
                    bestIteration = i;
                    System.out.printf("Iteration %d: Fitness %f\n", i, best);
                }
            }
            three[two] = best;
            System.out.printf("Test number %d, iteration %d, fitness %f.\n", two, bestIteration, best);
        }
        float max = 0;
        for (int four = 0; four < one; four++) {
            if (three[four] > max) {
                max = three[four];
            }
        }
        System.out.printf("Best found fitness is: %f\n", max);
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
