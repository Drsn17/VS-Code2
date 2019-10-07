public with sharing class Script12 {
	public static void fibonacci()
	{
		integer a=0,b=1,c;
		for(integer i=1;i<5;i++)
		{
			c=a+b;
			a=b;
			b=c;
			system.debug(c);
		}
	}
    
}