/*********************************************************************************************************
* Class Name  	: CA_AccountRatingToContact
* Test Class.   :
* @Author       : DARSHAN SINGH ALMIYA	
* @Date         : 08 Nov 2017
* @Description : This apex class is used to
* UPDATES
* Version          Developer                    Date                        Description
*-------------------------------------------------------------------------------------------
*     1.0                                      07 Nov 2017                   Initial Creation 
****************************************************************************************************************/

public class CA_AccountRatingToContact {
	public static void add(List<Account> Accounts)
	{
        List<Contact> Contacts=new List<Contact>();
        list<Task> taskList= new list<Task>();
        List<Account_Scheduler__c> AccScheduler=new List<Account_Scheduler__c>();
		set<id> AccountId= new Set<id>();
        for(Account acc:Accounts)
        {
			AccountId.add(acc.Id);
        }
        List<Account> accList=[select Name, Rating from Account where id in: AccountId]; 
		for(Account AccNew:accList)
		{
			if(AccNew.Rating=='Warm')
            {
				Contact c=new Contact();
				c.AccountId=AccNew.id;
				c.LastName='ContactRating';   
				Contacts.add(c);	
				
				for(Integer i=0;i<6;i++)
				{
					Account_Scheduler__c accountSchedule=new Account_Scheduler__c();
					accountSchedule.Account__c=AccNew.Id;  
					accountSchedule.name='Scheduler Test'+i;  
					accountSchedule.Time_Schedule__c=DateTime.newInstance(2017, 11, 13, 13, 6, 16).addMinutes(i);
					AccScheduler.add(accountSchedule);    
				}				  
			}
		}
		if(Contacts.size()>0)
		{
			insert Contacts;
		}	
		if(AccScheduler.size()>0)
		{
				insert AccScheduler;
		}
        
        
        CA_ContactSchedulable a=new CA_ContactSchedulable();
        a.SchuduleMake(Contacts);
        
      /*  for(Contact c:Contacts)
        {
        Task t = new Task();
        t.WhoId = c.Id;
        t.Subject = 'Task';
        taskList.add(t);
    }
    insert taskList;*/
        
	}		
}