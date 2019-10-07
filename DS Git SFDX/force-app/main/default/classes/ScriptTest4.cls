public with sharing class ScriptTest4 {
    public static void add()
    {
    	list<Opportunity> oppList=[select AccountId,Account.name from Opportunity where stageName='closed Won' and TotalOpportunityQuantity>2];
    	for(Opportunity opp:oppList)
    	{
    		
    		System.debug('AccountId===='+opp.Accountid +'  ' + 'Account Name'+ opp.Account.name);
    	}
    	  
    }
}