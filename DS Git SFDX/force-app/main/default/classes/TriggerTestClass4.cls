public with sharing class TriggerTestClass4 {
    	public static void addCase(List<Opportunity> oppList)
	{
	
			list<case> caseList=new list<case>();
			for(Opportunity opp:oppList)
			{
				if(opp.stageName=='Closed Lost')
				{
				case c=new case();
				c.AccountId=opp.AccountId;
				c.Type='Mechanical';
				c.Reason='Feedback';
				c.Priority='High';
				c.Description='Case Description';
				c.EngineeringReqNumber__c='101';
				c.Product__c='GC1040';
				c.SLAViolation__c='Yes';
				c.Origin='Phone';
				c.Status='Working';
				c.subject='My Subject';
				//c.Comments='This case is created by the Trigger';
				
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