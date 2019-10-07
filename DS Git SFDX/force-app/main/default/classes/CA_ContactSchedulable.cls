global class CA_ContactSchedulable implements Schedulable  
{
  public  list<Contact> clist=new list<Contact>();
    
   global   void SchuduleMake(list<Contact> cllist)
	{
		for(Contact c:cllist)
        {
            clist.add(c);
        }
        String cron='0 0 0/1 1/1 * ? *';
		System.schedule('Contact Trigger1',cron,new CA_ContactSchedulable());		
	} 
	
    public void execute(SchedulableContext sc) 
    {
    	
     	CA_ContactBatch b=new CA_ContactBatch(clist);
     	Database.executeBatch(b);	
    }
}