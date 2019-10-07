public with sharing class SQ2 {
	public static void eventTest()
	{
		list<Contact> conlist=[select id from Contact where name='Event Contact'];
		list<Event__c> eventList=[select id from Event__c where Name='My Event'];
		
		list<Event_Participant__c> epList=new list<Event_Participant__c>();
			for(integer i=0;i<10;i++)
			{
				Event_Participant__c ep=new Event_Participant__c();
				ep.Name='Event Test'+i;
				ep.Contact__c=conList.get(0).id;
				ep.Event__c=eventList.get(0).id;
				if(i<4)
				{
					ep.My_List__c='Attendee Contact';
					
				}
				else if(i>4 && i<8)
				{
					ep.My_List__c='Presenter Contact'; 
				}
				else
				{ 
					ep.My_List__c='Organizer Contact';
				}
				epList.add(ep);
			}
			insert epList; 
		
	}    
}