@isTest()
public class Batch7Test {

    static testMethod void myTest() {
    	
    	list<Account> account1 = new list<Account>();
        for(integer i=0;i<5;i++)
        {
            Account acc=new Account();
            acc.name='Test'+i;
            acc.Count__c=1;
            account1.add(acc);
        }
    	Insert account1;
        
        list<Contact> conList=new list<Contact>();
        for(Account a:account1)
        {
            Contact con1=new Contact();
            con1.AccountId=a.Id;
            con1.LastName='Test1';
            conList.add(con1);
        }
        insert conList;
        
    
        Test.StartTest();

        Batch7 obj = new Batch7();
     	
     	Database.executeBatch(obj);
	    
	    Test.StopTest();   
       
    }
}