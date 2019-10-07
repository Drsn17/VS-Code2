public with sharing class TQS9 {
	public static void AddressCopy(list <Contact> conList)
	{
		list<User> userList= [select Street,Country,State from user where id =: UserInfo.getUserID()];
		
		System.debug('-------------------------------'+ userList);
		list<Contact> conNewList=[select id, AccountId from Contact where id in: conList and ( MailingState = null or MailingCountry = null or MailingStreet= null)];
		
		system.debug('++++++++++++++++++++++++++++++='+ conNewList);
		list<Contact> conUpdateList= new list<contact>();
		list<Account> accList =new list<Account>();
		
		if(conNewList.size()>0)
		{
			for(User u:userList)
			{
				for(contact c:conNewList)
				{
					contact con=new contact();
					con.id=c.id;
					con.MailingState=u.State;
					con.MailingCountry=u.Country;
					con.MailingStreet=u.Street;	
					
					conUpdateList.add(con);
					
					Account acc=new Account();
					acc.BillingCountry=u.Country;
					acc.BillingState=u.State;
					acc.BillingStreet=u.Street;
					
					accList.add(acc);				
				}
			}
			if(conUpdateList.size()>0)
			update conUpdateList;
			if(accList.size()>0)
			update accList;
			system.debug('+++++++++++++++++UPdated List+++++++='+ conUpdateList);
			system.debug('++++++++++++++++++AccountList++++++++++++='+ accList);
	
		}
	}
	
		   
}