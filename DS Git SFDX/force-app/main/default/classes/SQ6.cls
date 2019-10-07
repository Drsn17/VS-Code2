public with sharing class SQ6 {
	public static void oppTest()
	{
		List<Opportunity> oppList= [select id, AccountId from Opportunity where StageName='Closed Won' and AccountId != null and Account.QS6__c='ASIA' and HasOpportunityLineItem = true ];
		List<OpportunityLineItem> oliList=[select id,Product2Id, Opportunity.AccountId, Quantity from OpportunityLineItem where OpportunityId in:oppList];
		
		List<OpportunityLineItem> oliNewList=new List<OpportunityLineItem>();
    	for(OpportunityLineItem oli :oliList)
    	{    
    		OpportunityLineItem oli1= new OpportunityLineItem();
    		oli1.Quantity=oli.Quantity;
    		oliNewlist.add(oli);
    	}
		System.debug(oliNewList);
	}
    
}