package testers;

import batzel.life.gameoflife.GameOfLife;
import static testers.BruteForce.*;

/**
 * Sean Batzel
 * 
* Completely random aggressive mutation method Test for - Increasing fitness
 * Termination Condition - Iterations WITHOUT increase of fitness.
 */
public class SmartSolver {

    public static void main(String args[]) {
        best = 0;
        startcells = new float[10000000];
        int k = 0;
        int noChange = 0;
        while (noChange < 100000) {
            world = new boolean[20][20];
            world = makeworld();
            GameOfLife game = new GameOfLife(world, 20, 20);
            startcells[k] = game.findSurvivalRate();
            if (startcells[k] < 4) {
                continue;
            }
            for (int j = 0; j < 1000; j++) {
                game.theGameOfLife();
            }
            float current = (game.findSurvivalRate()/(2*startcells[k]));
            if (current > best) {
                best = current;
                now = world;
                bestIteration = k;
                System.out.printf("Iteration %d: Fitness %f\n", k, best);
                noChange = 0;
            }
            else noChange++;
            if(noChange > 100000) System.err.println("LOOP CONDITION MET");
            k++;
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
}
