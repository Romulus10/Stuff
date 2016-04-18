package gameoflifega;

public class GameOfLifeGA {

    public static void main(String[] args) {
        int[] fitnum = new int[4];
        World[] mapset = new World[4];
        int iwb = 0; //Iterations Without Better
        while (iwb < 1000){
            // Get the next set of fitnesses.
            // Sort the results.
            // Create the next generation.
        }
    }

    private static void nextGen(int[] arr, World[] rra){
        
    }
    
    private static void gameOfLife(int[] arr, World[] rra){
        
    }
    
    private static void resultsSort(int[] arr, World[] rra) {
        boolean swapped = true;
        int j = 0;
        int tmp;
        World tmp2;
        while (swapped) {
            swapped = false;
            j++;
            for (int i = 0; i < arr.length - j; i++) {
                if (arr[i] > arr[i + 1]) {
                    tmp = arr[i];
                    tmp2 = rra[i];
                    arr[i] = arr[i + 1];
                    rra[i] = rra[i + 1];
                    arr[i + 1] = tmp;
                    rra[i + 1] = tmp2;
                    swapped = true;
                }
            }
        }
    }
}
