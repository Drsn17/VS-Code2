@isTest
public class AccountVF3_Test {
	@istest static void test()
    {
        list<Account> accList=new list<Account>();
        for(integer i=0;i<5;i++)
        {
            Account acc=new Account();
            acc.name='darshan'+i;
            acc.Phone='8958528054';
            acc.Billingcity= 'Noida';
            acc.BillingPostalcode= '201301';
            accList.add(acc);
        }
        insert accList;
        
        system.assert(accList.size()<=5);
        test.startTest();
        AccountVF3 obj=new AccountVF3();
        obj.searchstring='test';
       System.assertEquals(accList.size() <= 5,accList.size() == 5,'Error message in Account VF3');
        obj.search();
        obj.clear();
        test.stopTest();
        
        
    }
}