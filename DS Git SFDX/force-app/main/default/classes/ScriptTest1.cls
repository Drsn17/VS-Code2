public with sharing class ScriptTest1 {
	public static void addProduct()
	{
		List<OpportunityLineItem> oliList=[select Product2Id,Quantity from OpportunityLineItem where Opportunity.stagename='Closed Won' and Quantity>100];
		
		for(OpportunityLineItem opp:oliList) 
		{
			System.debug('Quantity==='+ opp.Quantity); 
		}
				     
	}
     
}