public with sharing class TQS5
{
    public static void DayError(list<OpportunityLineItem> oliList)
    {
    	for(OpportunityLineItem oli:oliList)
    	{
    		if(oli.Quantity > Date.today().day())
    		{
    			oli.adderror('User enter quantity more than today day');
    		}
    	}
    }
}