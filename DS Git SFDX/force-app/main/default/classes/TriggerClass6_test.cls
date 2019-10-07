@isTest
public with sharing class TriggerClass6_test {
    @isTest static void test()
    {
    	test.startTest();
    	list<Opportunity> opplist=new list<Opportunity>();
    	for(integer i=0;i<10;i++)
    	{
    		Opportunity opp=new Opportunity();
    		opp.name='darsha';
    		opp.stageName='Closed Won';
    		opp.CloseDate=date.today();
    		oppList.add(opp);
    		
    	}
    	if(oppList.size()>0)
    	insert oppList;
    	
    	
    }
}