public with sharing class Script10 {
	public static void display()
	{
		List<Account> accList=new List<Account>();
		accList=[select Name from Account order by Name];
		
		for(Account acc:accList)
		{
			system.debug(acc.Name);
		}	
	}    
}