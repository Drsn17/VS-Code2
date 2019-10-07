@isTest
public with sharing class TriggerClass1_test {
    @isTest static void test()
    {
    	test.StartTest();
    	list<Account> accList=new list<Account>();
    	for(integer i=0;i<5;i++)
    	{
    		Account acc=new Account();
    		acc.Name='Account Test'+i;
    		acc.NumberOfEmployees=5;
    		accList.add(acc);
    	}
    	if(accList.size()>0)
    	{
    		insert accList;
    		System.assert(accList.size()==5, 'less number of account had been created');
    		
    	}
    	test.stopTest();
    }
}