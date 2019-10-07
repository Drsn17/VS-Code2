global class Batch4 implements Database.Batchable<sObject>{
	global Database.QueryLocator start(Database.BatchableContext bc)
	{
		String query='select id from Opportunity limit 1';
    	return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext bc, list<Opportunity> scope)
	{
		list<Opportunity> oppList=new list<Opportunity>();
		for(integer i=0;i<=5;i++)
		{
			Opportunity opp=new Opportunity();
			opp.name = 'Opp' + i;
			opp.StageName = 'Prospecting';
			opp.CloseDate = Date.Today();
			oppList.add(opp);
		}
		insert oppList; 
		
	}
	global void finish(Database.BatchableContext bc)
	{
	}  
}