@isTest
public class Script11_test {
	@isTest static void test()
    {
        list<Account> accList=new list<Account>();
        for(integer i=0;i<5;i++)
        {
            Account acc=new Account();
            acc.name='Darshan'+i;
            acc.numberOfEmployees=1;
            accList.add(acc);
        }
        if(accList.size()>0)
        {
            insert accList;
        }
        Test.startTest();
        Script11.reverce();
        Test.stopTest();
        
    }
    
}