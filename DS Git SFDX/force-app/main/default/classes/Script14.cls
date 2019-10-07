public with sharing class Script14 {
	public static void display()
	{
		List<Product2> proList=new List<Product2>();
		proList=[select Description from Product2 where Description like '%a%'];
		
		for(Product2 pr:proList)
		{
		system.debug(pr);
		}
    
    }
}