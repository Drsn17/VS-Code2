@isTest
public with sharing class PrevtoDelrec_test {
    @isTest static void test()
    {
    	
    	list<Account> accList=new list<Account>();
		list<Contact> conList=new list<contact>();
    	for(integer i=0;i<10;i++)
    	{
    		Account acc=new Account();
    		acc.name='abc';
    		acc.Industry='It';
    		accList.add(acc);  
    		
    	}
		insert accList;
		for(Account acc:accList)
		{
			Contact con=new Contact();
			con.AccountId=acc.Id;
			con.lastName='dsa';
			conList.add(con);
		}
		insert conList;
        test.startTest();
        delete accList;
    	
    	test.stopTest(); 
    }
}