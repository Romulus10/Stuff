/*
 * Basic struture from Dr. Beidler's template.
 * 
 * Worked on it with Andrew Plaza.
 */


public class RollDice {
	
	//Create an array to contain any relatively small number of results.
	private Integer[] result;
	
	//Create an object to handle two new dice.
	private Dice pair;
	
	public int sum;

	//Constructor.
	public RollDice(){
	}
	
	public void set()
	{
		pair = new Dice();
		pair.roll();
	}
	
	public Integer getSum()
	{
		for (int i = 0; i < result.length; i++)
		{
			sum += result[i];
		}
		return sum;
	}
	
	
	public void roll(Integer num)
	{
		
		result = new Integer[num];
		
		for (int i = 0; i < num; i++)
		{
			set();
			int die1 = pair.get(1);
			int die2 = pair.get(2);
			result[i] = die1 + die2;
		}
	}
	
	/*
	*public void roll(int x)
	*{
	*	for (int i = 1; i < x; i++)
	*	{
	*		
	*		 Dice dice = new Dice();
	*		 dice.roll();
	*		 Integer y = dice.get(1);
	*		 Integer z = dice.get(2);
	*		 result = result + y;
	*		
	*	}
	*}
	*/
	
	public Integer[] results()
	{
		return result;
	}
}
