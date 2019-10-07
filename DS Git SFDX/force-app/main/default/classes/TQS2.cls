public with sharing class TQS2 {
    public static void eventT(list<Event_Participant__c> eList)
    {
        for(Event_Participant__c ep : EList)
        { 
 			for(Event_Participant__c epc:[select Id,Contact__c,Event__c from Event_Participant__c where Contact__c!=NULL AND Event__c !=NULL])
            { 
  				if(ep.Contact__c == epc.Contact__c && epc.Event__c==ep.Event__c)
                { 
   					ep.addError('You can not add two record in in same contact'); 
   				}
  			}
 		} 
	}
 }