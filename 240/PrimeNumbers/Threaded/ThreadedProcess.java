public class ThreadedProcess extends Thread{
	
	private int low;
	private int high;
	private int count;

	public ThreadedProcess(int x, int y){
		this.low = x;
		this.high = y;
		this.count = 0;
	}

	public void run(){
		int i = this.low;
		while(i < this.high){
			if(this.isPrime(i)){
				System.out.println(i);
				this.count++;
			}
			i++;
		}
	}

	private static boolean isPrime(int n){
		if (n % 2 == 0) return false;
    		for(int i = 3; i * i <=n; i += 2) {
        		if(n % i == 0) return false;
    		}
    		return true;
	}

	public int getCount(){
		return this.count;
	}
}