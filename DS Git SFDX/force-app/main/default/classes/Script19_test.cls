@isTest
public with sharing class Script19_test {
	static testmethod void case_test()
	{
		list<Account> accList=new list<Account>();
		list<Contact> ConList=new list<Contact>();
		for(integer i=0;i<5;i++)
		{
			Account ac=new Account();
			ac.name='Account'+i;
            ac.NumberOfEmployees=1;
			accList.add(ac);
			
			Contact con=new Contact();
			con.lastName='singh'+i;
			conList.add(con);     
		}
        if(accList.size()>0 && conList.size()>0)
        {
		insert accList;
		insert ConList; 
        }
		test.startTest();
		Script19.addCase();
		test.stopTest(); 
		
		
	}
    
}