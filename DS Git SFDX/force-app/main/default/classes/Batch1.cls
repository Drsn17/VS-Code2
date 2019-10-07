global class Batch1  implements Database.Batchable<SObject>
	{
		global Database.QueryLocator start(Database.BatchableContext BC)
		{
    		Date date1 = system.today()-10;
        	string query = 'select id  from Account where createdDate= today';
        	System.debug('-----------1'+query);
        	return Database.getQueryLocator(query);
		}
		global void execute(Database.BatchableContext BC, List<Account>scope)
		{
			for(Account acc:scope)
        	if(scope.size()>0)
        	system.debug('------------'+scope);
        	delete scope;
		}
		global void finish(Database.BatchableContext BC)
		{
			system.debug('Account Deleted');
		}
		
	}