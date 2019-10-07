@isTest
public with sharing class TriggerClass4_test {
	@isTest static void test()
	{
		test.startTest();
		list<Account> accList=new list <Account>();
		for(integer i=0;i<5;i++)
		{
			Account acc= new Account();
			acc.name='AccountTest'+i;
            acc.NumberOfEmployees=2+i;
			accList.add(acc);
		}
		if(accList.size()>0)
		{
			insert accList;
		}
		list<Contact> conList=new list<Contact>();
            for(integer i=0;i<2;i++)
            {
			Contact con=new Contact();
			con.AccountId=accList[0].Id;
			con.LastName='Contact Last';
			conList.add(con);
			}
		if(conList.size()>0)
		{
			insert conList;
		}
		test.stopTest();
	}
	
    
}