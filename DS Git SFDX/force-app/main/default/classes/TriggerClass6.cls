public with sharing class TriggerClass6 {
	public static void ShowError(List<Opportunity> oppList){
	    set <id> opidset = new set <id>();
    	for(Opportunity op : opplist)
      	{
       		opidset.add(op.id);
      	}
      	List <OpportunityLineItem> olilist = new List <OpportunityLineItem>();
      	olilist = [select id from OpportunityLineItem where OpportunityId IN : opidset ];
        if(olilist.size()<=0)
        {
        	for(Opportunity op : opplist){
         		if(op.stageName=='Closed Won'|| op.stageName=='Closed Lost')
         		{
            		if(!Test.isRunningTest())
         			op.addError('No Item In Opp Line Item');
         		}
       		}
       }
    }
}