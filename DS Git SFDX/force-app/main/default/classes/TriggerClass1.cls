public with sharing class TriggerClass1 {
	public static void add1(List<Account> ac)
	{
		
		if(ac.size()>0)
		{
			List<Contact> con=new List<Contact>();
			for(Account ac1:ac)
			{
				for(integer i=0;i<ac1.NumberOfEmployees;i++) 
				{
					Contact c=new Contact();
					c.AccountId=ac1.id;
					c.LastName='Trigger Hello'+i;   
					con.add(c);			 
				}
			}
			if(con.size()>0)
			{
			insert con;
			}
			
		}
		
		
	}
    
}