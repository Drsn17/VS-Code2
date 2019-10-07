@isTest
public with sharing class Script20_test {
    @isTest static void attchAccountImage()
    {
        list<Account> accList=new list<Account>();
        for(integer i=0;i<5;i++)
        {
    	Account acc=new Account();
    	acc.name='dsa';
        acc.NumberOfEmployees=1;
        accList.add(acc);
        }
    	insert accList;
    	
        list<Contact> conList=new list<Contact>();
        for(Account a:accList)
        {
            Contact con=new Contact();
            con.AccountId=accList[0].Id;
            con.LastName='ContTest';
            conList.add(con);
        }
        insert conList;  
		
        List<Attachment> attch = new list<Attachment>();
        for(Account ac:accList)
        {
    	Attachment a=new Attachment();
    	a.Name='Attchment1';
    	Blob boyBlob=Blob.valueOf('Unit Test Attachment Body'); 
    	a.Body=boyBlob;
    	a.ParentId=ac.id;
        attch.add(a);
        }
    	insert attch;

    	test.startTest();
    	Script20.attchment1();
    	test.stopTest();   
    	
    				
    }
}