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
			System.out.print(i);
			if(isPrime(i)){
				System.out.print(" is prime!");
				count++;
			}
			i++;
			System.out.print("\n");
		}
		System.out.printf("%d prime numbers found.", count);
	}

	private static boolean isPrime(int x){
		int count = 2;
		while(count < x){
			if(x % count == 0 && count != x) return true;
		}
		return false;
	}
}
