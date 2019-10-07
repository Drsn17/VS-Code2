@isTest
public with sharing class TriggerClass2_test {
    @isTest static void test()
    {
    	test.startTest();
    	list<Opportunity> oppList=new list<Opportunity>();
    	for(integer i=0;i<10;i++)
    	{
    		Opportunity opp=new Opportunity();
    		opp.name='darsha';
    		opp.stageName='Closed Won';
    		opp.CloseDate=date.today()-1;
    		oppList.add(opp);
    		
    	}
    	insert oppList;
    	test.stopTest(); 
    }
}