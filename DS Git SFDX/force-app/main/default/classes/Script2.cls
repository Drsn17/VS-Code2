public with sharing class Script2 {
	public static void add()
	{
		List<Account> accList=new List<Account>();
		List<Contact> contList=new List<Contact>();
		
		for(integer i=1;i<=10;i++)
		{
			
				Account acc=new Account();
				acc.Name='My Account'+i;
            acc.NumberOfEmployees=1;
				accList.add(acc);
			}
			insert accList;
			System.debug('Account'+accList);
		
			for(integer i=1;i<=10;i++)
			{
				Contact con=new Contact();
				con.Lastname='Singh'+i;
				con.AccountId=accList.get(i-1).Id;
				contList.add(con);
			
		}
		insert contList;
		system.debug('Contact'+contList);
		
	}
}