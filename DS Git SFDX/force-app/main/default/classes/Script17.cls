public with sharing class Script17 {
	public static void binnaryAdd()
	{
		integer a=100101;
		integer b=0101101;
		integer remainder=0;
		integer []sum=new integer[7];
		integer i;
		
		for(i=0;i<sum.size();i++)
		{
			if(a!=0||b!=0)
			{
				sum[i]=(integer)(math.mod((math.mod(a,10) + math.mod(b,10) +remainder),2));
				remainder=(integer)((Math.mod(a,10)+math.mod(b,10)+remainder)/2);
				a=a/10;
				b=b/10;
			}
			
		}
		if(remainder!=0)
			{
				sum[--i]=1;
			}
			for(i=6;i>=0;i--)
			{
				System.debug(sum[i]);
			}
		
	}
    
}