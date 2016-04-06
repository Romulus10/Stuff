package testers;


/**
 * Sean Batzel 3/31/2016.
 */
import batzel.life.gameoflife.GameOfLife;

public class BruteForce {

    static float best;
    static boolean[][] world;
    static boolean[][] now;
    static float[] startcells;
    static int bestIteration;

    public static void main(String[] args) {
        best = 0;
        startcells = new float[1000000];
        for (int i = 0; i < 1000000; i++) {
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
            float current = (game.findSurvivalRate()/(2*startcells[i]));
            if (current > best) {
                best = current;
                now = world;
                bestIteration = i;
                System.out.printf("Iteration %d: Fitness %f\n", i, best);
            }
        }
        System.out.println("Best fitness found: ");
        System.out.printf("\tIteration %d: Fitness %f\n", bestIteration, best);
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
