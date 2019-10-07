public with sharing class SQ3 {
	public static void oppTest()
	{
		List<Opportunity> oppList= [select id, AccountId from Opportunity where AccountId != null and HasOpportunityLineItem = true];
		List<OpportunityLineItem> oliList=[select id,Product2Id, Opportunity.AccountId from OpportunityLineItem where OpportunityId in:oppList];
		
		map<Id,Integer> map_id=new map<Id, Integer>();
    	for(OpportunityLineItem oli :oliList)
    	{    
    		if(!map_id.containsKey(oli.Opportunity.AccountID))
    		{
    			map_id.put(oli.Opportunity.AccountID,0);
    		}
    		Integer temp=map_id.get(oli.Opportunity.AccountID);
    		temp=temp+1;
    		map_id.put(oli.Opportunity.AccountID,temp);
    	}
    	List<Account> accList=new List<Account>();
    	for(ID a : map_id.keySet())
    	{
    		if(map_id.get(a)>2) 
    		{ 
    			Account acc= new Account();
    			acc.ID=a;
    			acclist.add(acc);
    		}
    	}
    	System.debug(accList);
	}
    
}