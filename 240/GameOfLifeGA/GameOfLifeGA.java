public class GameOfLifeGA {

    static int ITERATIONS = 10000;
    static GameOfLife life;
    static float[] fitnesses;
    static World[] worlds;
    static float bestFitness;
    static World bestWorld;
    static World parent1;
    static World parent2;
    static World child;

    public static void main(String[] args) {
        fitnesses = new float[20];
        worlds = new World[20];
        int count = 0;
        for (int i = 0; i < 20; i++) {
            worlds[i] = new World(makeworld());
        }
        while (count < ITERATIONS) {
	    System.out.printf("Count: %d\n", count);
            // Get the next set of fitnesses.
            gameOfLife();
            // Sort the results.
            resultsSort();
            // Create the next generation.
            nextGen();
            count++;
        }
        System.out.printf("Best fitness: %f\n", bestFitness);
        for (int i = 0; i < 9; i++) {
            System.out.printf("Solution %d of 10, Fitness %f\n", i + 1, fitnesses[i]);
            for (int j = 0; j < 20; j++) {
                for (int k = 0; k < 20; k++) {
                    if (worlds[i].getWorld()[j][k]) {
                        System.out.print("X ");
                    } else {
                        System.out.print("o ");
                    }
                }
                System.out.print("\n");
            }
            System.out.print("\n");
        }
        System.out.printf("Solution 10 of 10 - BEST SOLUTION FOUND - Fitness %f\n", bestFitness);
        for (int j = 0; j < 20; j++) {
            for (int k = 0; k < 20; k++) {
                if (bestWorld.getWorld()[j][k]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.print("\n");
        }
        System.out.print("\n");
        System.out.println("Parent 1: ");
        for (int j = 0; j < 20; j++) {
            for (int k = 0; k < 20; k++) {
                if (parent2.getWorld()[j][k]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.print("\n");
        }
        System.out.print("\n");
        System.out.println("Parent 2: ");
        for (int j = 0; j < 20; j++) {
            for (int k = 0; k < 20; k++) {
                if (parent1.getWorld()[j][k]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.print("\n");
        }
        System.out.print("\n");
        System.out.println("Child: ");
        for (int j = 0; j < 20; j++) {
            for (int k = 0; k < 20; k++) {
                if (child.getWorld()[j][k]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.print("\n");
        }
        System.out.print("\n");
    }

    private static void nextGen() {
        World[] tmp = new World[fitnesses.length];
        System.arraycopy(worlds, 0, tmp, 0, worlds.length);
        //Crossover
        //Each of the 5 crossover worlds is the child of 2 of the top 5.
        //e.g. 10's parents are 0 and 1, 11's parents are 1 and 2, etc.
        //Each child takes cells from each parent with (0,0) to (9,9) being
        //from the first parent and (10,10) to (19,19) being from the second.
        for (int i = 10; i < 15; i++) {
            boolean[][] tmp2 = tmp[i - 10].getWorld();
            parent1 = tmp[i - 10];
            boolean[][] tmp3 = tmp[i - 9].getWorld();
            parent2 = tmp[i - 9];
            boolean[][] tmp4 = tmp2;
            for (int j = 10; j < 20; j++) {
                for (int k = 10; k < 20; k++) {
                    tmp4[j][k] = tmp3[j][k];
                }
            }
            tmp[i] = new World(tmp4);
            child = tmp[i];
        }
        //Mutation
        //We're just going to NOT 15 random positions on the board.
        for (int i = 15; i < 20; i++) {
            World tmp2 = tmp[i];
            boolean[][] tmp3 = tmp2.getWorld();
            for (int j = 0; j < 15; j++) {
                int one = (int) Math.floor(Math.random() * 20);
                int two = (int) Math.floor(Math.random() * 20);
                tmp3[one][two] = !tmp3[one][two];
            }
            tmp[i] = new World(tmp3);
        }
        worlds = tmp;
    }

    private static void gameOfLife() {
        for (int x = 0; x < worlds.length; x++) {
            life = new GameOfLife(worlds[x].getWorld(), 20, 20);
            float tmp = life.findSurvivalRate();
            for (int i = 0; i < 1000; i++) {
                life.theGameOfLife();
            }
            fitnesses[x] = life.findSurvivalRate() / (2 * tmp);
        }
    }

    private static void resultsSort() {
        boolean swapped = true;
        int j = 0;
        float tmp;
        World tmp2;
        while (swapped) {
            swapped = false;
            j++;
            for (int i = 0; i < fitnesses.length - j; i++) {
                if (fitnesses[i] < fitnesses[i + 1]) {
                    tmp = fitnesses[i];
                    tmp2 = worlds[i];
                    fitnesses[i] = fitnesses[i + 1];
                    worlds[i] = worlds[i + 1];
                    fitnesses[i + 1] = tmp;
                    worlds[i + 1] = tmp2;
                    swapped = true;
                }
            }
        }
        if (fitnesses[0] > bestFitness) {
            bestFitness = fitnesses[0];
            bestWorld = worlds[0];
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
