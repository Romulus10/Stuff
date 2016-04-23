public class ThreadedDriver{
	public static void main(String[] args) throws InterruptedException{
		ThreadedProcess one = new ThreadedProcess(1000000, 1250000);
		ThreadedProcess two = new ThreadedProcess(1250000, 1500000);
		ThreadedProcess thr = new ThreadedProcess(1500000, 1750000);
		ThreadedProcess fou = new ThreadedProcess(1750000, 2000000);
		one.start();
		two.start();
		thr.start();
		fou.start();
		one.join();
		two.join();
		thr.join();
		fou.join();
		int count = one.getCount() + two.getCount() + thr.getCount() + fou.getCount();
		System.out.printf("\n%d prime numbers found.\n", count);	
	}
}