public with sharing class SQ5 {
	public static void oppTest()
	{
		List<Opportunity> oppList= [select id, AccountId from Opportunity where StageName='Closed Won' and AccountId != null and HasOpportunityLineItem = true ];
		List<OpportunityLineItem> oliList=[select id,Product2Id, Opportunity.AccountId from OpportunityLineItem where OpportunityId in:oppList and Quantity>100];
		
		List<Account> accList=new List<Account>();
    	for(OpportunityLineItem oli :oliList)
    	{    
    		Account acc= new Account();
    		acc.Id=oli.Opportunity.AccountId;
    		acc.name=oli.Opportunity.Account.Name;
    		acclist.add(acc);
    	}
		System.debug(accList);
	}
    
}