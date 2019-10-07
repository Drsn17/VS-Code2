global class CA_ContactBatch  implements Database.Batchable<SObject>
{
    public list<Contact> clist4=new list<Contact>();
 	 public  CA_ContactBatch(list<Contact>  clist2)
    {
        for(contact c:clist2){
            
            clist4.add(c);
        	} 
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
	{
    	Date date1 = system.today();
       	string query = 'select id  from Contact where order by createdDate DESC limit 1';
       	System.debug('-----------1'+query);
       	return Database.getQueryLocator(query);
	}
	global void execute(Database.BatchableContext BC, List<Contact>scope)
	{
        list<Task> taskList= new list<Task>();
		for(Contact con:scope)
        {
       	if(scope.size()>0)
        {
        system.debug('------------'+scope);
        Task t = new Task();
        t.WhoId = con.Id;
        t.Subject = 'Task';
        taskList.add(t);   
    	}
        } 
        Insert taskList;
       	insert scope;
	}
	global void finish(Database.BatchableContext BC)
	{
        cronTrigger ct=[select id from CronTrigger where CronJobDetail.Name like 'Contact Trigger'];
		system.debug('Contact Created');
        System.abortJob(ct.id);
	}
}