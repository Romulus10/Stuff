package gameoflifega;

public class World {
    private boolean[][] me;
    
    public World(boolean[][] otherme){
        me = otherme;
    }
    
    public boolean[][] getWorld(){
        return me;
    }
}
