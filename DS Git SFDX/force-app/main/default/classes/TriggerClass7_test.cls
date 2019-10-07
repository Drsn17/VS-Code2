@isTest
public with sharing class TriggerClass7_test {
    @isTest static void test()
    {
    	test.startTest();
    	list<Opportunity> oppList=new list<Opportunity>();
    	for(integer i=0;i<10;i++)
    	{
    		Opportunity opp=new Opportunity();
    		opp.name='darsha';
    		opp.stageName='Closed Won';
    		opp.CloseDate=date.today();
    		oppList.add(opp);
    		
    	}
    	insert oppList;
        
        Id pb2 = Test.getStandardPricebookId();
    	PriceBook2 pbb =new Pricebook2();
        pbb.id =  pb2;
        update pbb;
        
    	PriceBook2 pb=new PriceBook2();
		pb.name='Algo New Price Book';
		pb.isActive=true;
		
		insert pb;
              
    	test.stopTest(); 
    }
}