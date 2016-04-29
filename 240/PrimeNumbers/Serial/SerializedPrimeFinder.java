// Sean Batzel
// Prime Numbers
// Serialized Version

public class SerializedPrimeFinder{
	
	public static void main(String[] args){
		int SRT = 1000000;
		int END = 2000000;
		int i = SRT;
		int count = 0;
		while(i < END){
			if(isPrime(i)){
				if (count < 10){
					System.out.println(i);
				}
				count++;
			}
			i++;
		}
		System.out.printf("\n%d prime numbers found.\n", count);
	}

	private static boolean isPrime(int n) {
    		if (n % 2 == 0) return false;
    		for(int i = 3; i * i <=n; i += 2) {
        		if(n % i == 0) return false;
    		}
    		return true;
	}

}
