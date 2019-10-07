public with sharing class TriggerTestClass1 {
	public static void addCase(List<Opportunity> oppList)
	{
			list<case> caseList=new list<case>();
			for(Opportunity opp:oppList)
			{
				if(opp.stageName=='Closed Lost')
				{
					case c=new case();
					c.Description=opp.Description;
					c.Origin='Phone';
					c.Status='New';
					c.subject=opp.subject__c;
					caseList.add(c);
				}	  
			}
			if(caseList.size()>0)  
			{
			insert caseList; 
			System.debug('-------------------------------------'+caseList);
		}
	}
    
}