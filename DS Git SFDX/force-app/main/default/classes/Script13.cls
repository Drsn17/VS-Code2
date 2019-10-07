public with sharing class Script13 {
	public static void reverse()
	{
		Integer[] a=new Integer[]{7,8,9,2,3,4};
		for(integer i=0;i<a.size();i++)
		{
			system.debug(a[i]);
		}
		for(integer j=a.size()-1;j>=0;j--)
		{
			system.debug(a[j]);
		}
		
	}
    
}