public class GameOfLife extends Thread{
    private boolean[][] one;
    private final boolean[][] two;
    private final int[][] neighbors;
    private final int dim1;
    private final int dim2;

    public GameOfLife(boolean[][] world, int x, int y) {
        this.one = world;
        this.two = world;
        this.dim1 = x;
        this.dim2 = y;
        this.neighbors = new int[x][y];
    }
    
    public void theGameOfLife() {
        for (int i = 1; i < this.dim1-1; i++) {
            for (int j = 1; j < this.dim2-1; j++) {
                this.neighbors[i][j] = neighborHoodOf(i, j);
            }
        }
        for (int i = 1; i < this.dim1-1; i++) {
            for (int j = 1; j < this.dim2-1; j++) {
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
        int near = 0;
        for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
                if (this.one[i + x][j + y]) {
                    if (x == 0 && y == 0) {
                    } else {
                        near++;
                    }
                }
            }
        }
        return near;
    }

    public float findSurvivalRate(){
        float alive = 0;
        for (int i = 1; i < this.dim1-1; i++){
            for (int j = 1; j < this.dim2-1; j++){
                if (this.one[i][j]){
                    alive++;
                }
            }
        }
        return alive;
    }

    public void printTheWorld() {
        for (int i = 1; i < this.dim1-1; i++) {
            for (int j = 1; j < this.dim2-1; j++) {
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
