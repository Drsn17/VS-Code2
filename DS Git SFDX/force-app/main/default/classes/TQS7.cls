public with sharing class TQS7 
{
   public static void eventOrg(list<Event__c> eventList)
    {
    	list<Event_Participant__c> epList= [select id,name,Contact__c from Event_Participant__c where My_List__c='Organiser Contact'];
    	system.debug('event list --------------------------------'+epList);
    	for(Event__c ec : eventList)
    	{
    		integer temp=0;
    		for(Event_Participant__c epc : epList)
    		{ 
    			if(date.today()>ec.Event_Date__c)
    			{
    				temp++;
    			}
    		}
    		if(temp>1)
    		{
    			ec.adderror('can not insert in same Contact without future date');
    		}
    	}
    	
    }   
}