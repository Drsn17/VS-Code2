public with sharing class SQ8 {

	public static void aggregateTest()
	{
		list<account> acc=new list<account>();
		acc=[select id from account where QS6__c Includes('ASIA;NA') and NumberOfEmployees!=NULL];
        
        system.debug(acc);
        AggregateResult ar = [select SUM(NumberOfEmployees) from account where id in: acc];
        system.debug('sum of NumberOfEmployees='+ar);
	}    
}