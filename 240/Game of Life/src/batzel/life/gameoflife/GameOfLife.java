package batzel.life.gameoflife;

/**
 * Sean Batzel 3/18/2016.
 */

class GameOfLife {
    private boolean[][] one;
    private boolean[][] two;
    private int[][] neighbors;

    public GameOfLife(boolean[][] world) {
        this.one = world;
        this.two = world;
        this.neighbors = new int[20][20];
    }

    public void theGameOfLife() {
        for (int i = 1; i < 19; i++) {
            for (int j = 1; j < 19; j++) {
                this.neighbors[i][j] = neighborHoodOf(i, j);
            }
        }
        for (int i = 1; i < 19; i++) {
            for (int j = 1; j < 19; j++) {
                this.two[i][j] = life(i, j);
            }
        }
        this.one = this.two;
    }

    private boolean life(int i, int j) {
        if (this.one[i][j]) {
            if (neighbors[i][j] <= 3 && neighbors[i][j] >= 2) {
                return true;
            } else if (neighbors[i][j] > 3 || neighbors[i][j] < 2) {
                return false;
            }
        }
        if (!this.one[i][j]) {
            if (neighbors[i][j] == 3) {
                return true;
            } else
                if (neighbors[i][j] != 3) {
                    return false;
                }
        }
        return false;
    }

    public int neighborHoodOf(int i, int j) {
        int neighbors = 0;
        for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
                if (this.one[i + x][j + y]) {
                    if (x == 0 && y == 0) {
                    } else {
                        neighbors++;
                    }
                }
            }
        }
        return neighbors;
    }

    public void printTheWorld() {
        for (int i = 1; i < 19; i++) {
            for (int j = 1; j < 19; j++) {
                if (two[i][j]) {
                    System.out.print("X ");
                } else {
                    System.out.print("o ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }
}
