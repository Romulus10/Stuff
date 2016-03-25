/**
 * Sean Batzel 3/18/2016.
 */

//A class for holding various testing methods.

class GameOfLifeTests {
    @SuppressWarnings("unused")
    public void continuousTest(boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        int x = 0;
        while (x < 100) {
            game.theGameOfLife();
            game.printTheWorld();
            x++;
        }
    }

    @SuppressWarnings("unused")
    public void oneTest(boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        game.printTheWorld();
        game.theGameOfLife();
        game.printTheWorld();
    }

    @SuppressWarnings("unused")
    public void fiveTests(boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        game.printTheWorld();
        for (int i = 0; i < 5; i++) {
            game.theGameOfLife();
            game.printTheWorld();
        }
    }

    @SuppressWarnings("unused")
    public void neighborhoodTest(boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        game.theGameOfLife();
    }

    public void threeTests(@SuppressWarnings("SameParameterValue") boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        int i = 0;
        while (i < 3) {
            game.printTheWorld();
            game.theGameOfLife();
            i++;
        }
    }

    @SuppressWarnings("unused")
    public void isThisTheProblem(boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        for (int x = 1; x < 19; x++) {
            for (int y = 1; y < 19; y++) {
                System.out.print("[" + game.neighborHoodOf(x, y) + "," + game.getFirstValueOf(x, y) + "]");
            }
            System.out.println();
        }
    }

    @SuppressWarnings("unused")
    public void testNeighborsThrice(@SuppressWarnings("SameParameterValue") boolean[][] world) {
        GameOfLife game = new GameOfLife(world);
        for (int i = 0; i < 3; i++) {
            for (int x = 1; x < 19; x++) {
                for (int y = 1; y < 19; y++) {
                    System.out.print("[" + game.neighborHoodOf(x, y) + "," + game.getFirstValueOf(x, y) + "]");
                }
                System.out.println();
            }
            game.theGameOfLife();
            System.out.println();
        }
    }
}