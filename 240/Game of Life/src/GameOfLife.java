/**
 * Sean Batzel 3/18/2016.
 */


//IT ISN'T THE CONTROL FLOW
//I THINK IT'S READING THE WRONG ARRAY TO DETERMINE HOW MANY NEIGHBORS WE HAVE


class GameOfLife {
    private boolean[][] one; //The initial world.
    @SuppressWarnings("CanBeFinal") //TODO get rid of all of these inspection tags.
    private boolean[][] two; //A whole new world.
    @SuppressWarnings("CanBeFinal")
    private int[][] neighbors;

    public GameOfLife(boolean[][] world) { //Let's get this show on the road.
        this.one = world; //Make these guys
        this.two = world; //The same thing for right now.
        //Looks like booleans are 16 bytes.
        //That's ((20*20)*16)*2 = 12800 bytes.
        this.neighbors = new int[20][20]; //20 entries * 20 entries * 8 bytes per entry = 3200 bytes...
    }

    public void theGameOfLife() {
        //(O(n) * O(neighborHoodOf)) + (O(n) * (O(life)))
        //(O(n) * O(neighborHoodOf)) + (O(n) * O(1))
        //(O(n) * O(n)) + (O(n) * O(1))
        //(O(n^2)) + (O(n))
        //This should be something like O(n^2).
        for (int i = 1; i < 19; i++) { //8 bytes
            for (int j = 1; j < 19; j++) { //8 more bytes
                this.neighbors[i][j] = neighborHoodOf(i, j);
            }
        }
        for (int i = 1; i < 19; i++) { //8 bytes
            for (int j = 1; j < 19; j++) { //8 more bytes
                //System.out.println("Currently - " + this.one[i][j]);
                try {
                    this.two[i][j] = life(i, j); //TODO figure out why this doesn't work. DONE
                } catch (ThisIsReallyNotRightException e) {
                    System.out.println(e.msg);
                    System.exit(1);
                }
                //System.out.println(this.neighborHoodOf(i, j) + " ");
                //System.out.println("Now - " + this.two[i][j]);
            }
        }
        // Just copying the array, right? Do I need to reinitialize 'two'?
        this.one = this.two;
    }

    /*
    * Alright, as of 15:50 on 3/25, something is wrong with the control flow.
    * TODO fix control flow. DONE
    */

    private boolean life(int i, int j) throws ThisIsReallyNotRightException { //And then, life happens.
        //This should mostly be constant time.
        //System.out.println("We have " + neighbors + " neighbors.");
        if (this.one[i][j]) { //If we're currently alive.
            if (neighbors[i][j] <= 3 && neighbors[i][j] >= 2) {
                return true; //We have friends, we have food, what more could we want?
            } else if (neighbors[i][j] > 3 || neighbors[i][j] < 2) {
                return false; //You make me so lonely I could die.
            } else {
                throw (new ThisIsReallyNotRightException("The number of neighbors is off somehow."));
            }
        }
        if (!this.one[i][j]) { /*
            Otherwise, we're dead right now. TODO here is where I think the problem is. DONE
            Sometimes cells come to life, sometimes they don't. It looks like only one is *actually* coming to life,
            when there should be quite a few more.
            */
            if (neighbors[i][j] == 3) {
                return true; //A healthy new baby cell has been born!
            } else //noinspection ConstantConditions
                if (neighbors[i][j] != 3) {
                    return false; //Nope still dead.
                } else {
                    throw (new ThisIsReallyNotRightException("It's happening in the dead cell check."));
                }
        } else {
            throw (new ThisIsReallyNotRightException("It says that it's neither dead nor alive. STOP."));
        }
    }

    public int neighborHoodOf(int i, int j) {
        //This iterates, but only through 9 cells, ignoring the center cell.
        //I'm going to say O(n) just to be safe.
        int neighbors = 0;
        for (int x = -1; x <= 1; x++) { //8 bytes.
            for (int y = -1; y <= 1; y++) { //8 bytes.
                if (this.one[i + x][j + y]) {
                    //noinspection StatementWithEmptyBody
                    if (x == 0 && y == 0) {
                    } else {
                        neighbors++;
                    }
                }
            }
        }
        //System.out.println(neighbors);
        return neighbors;
    }

    public void printTheWorld() {
        //O(n) running time
        for (int i = 1; i < 19; i++) { //8 Bytes
            for (int j = 1; j < 19; j++) { //8 Bytes
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

    //TODO clean up source code.

    public char getFirstValueOf(int x, int y) {
        if (this.one[x][y]) return 'X';
        if (!this.one[x][y]) return '-';
        return 0;
    }

    /*
    * DISCOVERY - the problem seems to be that the program is determining the state of ONE SINGLE CELL
    * with every iteration, then just not doing anything after that. Is that accurate??
    * Okay yeah no that's not what's happening at all.
    * Maybe this - if the cell is dead and has three neighbors, it's just not bothering
    * to come back to life.
    */

}
