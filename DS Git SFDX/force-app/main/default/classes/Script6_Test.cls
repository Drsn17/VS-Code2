@isTest
public with sharing class Script6_Test {
	static testMethod void opp_test()
	{
		list<Opportunity> oppList=new list<Opportunity>();
		for(integer i=0;i<50;i++)
		{
			Opportunity opp=new Opportunity();
			opp.StageName='Closed Lost';
			opp.closeDate=date.today()+i;
			opp.Name='Test Opp'+i;
			oppList.add(opp);
		}
		if(oppList.size()>0){
			insert oppList;
		}
		System.assert(oppList.size()<=50);
		test.startTest();
		Script6.display();  // calling he class and its methods
		test.stopTest();
		
		list<Opportunity> oppList_Updated=new list<Opportunity>();
		oppList_Updated=[select id,name from Opportunity where CloseDate>today];
		System.debug(oppList_Updated);
		
	}
    
}