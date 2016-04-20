package gameoflifega;

public class World {

    // A wrapper class to make handling arrays of worlds easier.
    private boolean[][] me; // The boolean array wrapped by the object.

    public World(boolean[][] otherme) {
        me = otherme;
    }

    public boolean[][] getWorld() {
        return me;
    }
}
