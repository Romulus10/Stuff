
/**
 * Sean Batzel 3/31/2016.
 */
/**
 *
 * CURRENT ALGORITHM - Projected runtime is ___ hours.
 *
 * 10000 iterations takes 30 minutes. This will take 3000 minutes, which is 50
 * hours.
 *
 * Output should be Iteration: Fitness # On the last iteration, print the
 * starting and ending map. Brute Force Optimizer: While not done do Generate a
 * new design. This can be random. Evaluate the fitness. Do 1000 GoL iterations
 * and see how many survive. Replace if best so far. Try using a different
 * optimizer. Fitness Functions: Ex. f(x) = -x^2 + 5x + 1 f(3) = 7 f(0) = 1 f(2)
 * = 7 f(-1) = -5
 *
 * This could be a LOT more modular. Iteration 1: Fitness 1 Iteration 2: Fitness
 * 7
 *
 * Hill Climber Evaluate a point and evaluate small steps from there. Based on
 * the slope, we choose a new point. Ex. Start at x = -1, evaluate that (-5
 * using the example above), make determinations to find which direction it
 * should move, find best fitness based on that. So evaluate -1 evaluate -1 +
 * .001 if better, step toward increased x. Continue until the best fitness is
 * found.
 *
 * However, local optima mess with this in relation to global optima.
 */
import batzel.life.gameoflife.GameOfLife;

public class BruteForce {

    static int best;
    static boolean[][] world;
    static boolean[][] now;
    static boolean[][] last;
    static int startcells;

    public static void main(String[] args) {
        best = 0;
        for (int i = 0; i < 100; i++) {
            world = new boolean[20][20];
            world = makeworld();
            GameOfLife game = new GameOfLife(world, 20, 20);
            startcells = game.findSurvivalRate();
            if (startcells == 0) continue;
            for (int j = 0; j < 1000; j++) {
                game.theGameOfLife();
            }
            int current = game.findSurvivalRate();
            if (current > best) {
                best = current;
                now = world;
                System.out.println("Iteration " + i + " Fitness: " + (best / (2 * startcells)));
            }
        }
        System.out.println("Best fitness found: ");
        System.out.println("    Fitness of " + (best / (2 * startcells)));
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

    public static boolean[][] makeworld() {
        boolean[][] retur = new boolean[20][20];
        for (int x = 1; x < 19; x++) {
            for (int y = 1; y < 19; y++) {
                double check = Math.random();
                world[x][y] = check < .5;
            }
        }
        return retur;
    }
}
