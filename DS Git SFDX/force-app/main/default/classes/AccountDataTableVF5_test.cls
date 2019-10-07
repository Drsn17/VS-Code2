@isTest
public class AccountDataTableVF5_test {
	@isTest static void test1()
	{
        List <Account> accList = new List<Account>();
		Account acc=new Account();
        acc.name='tesasasas454545t';
       	//acc.NumberOfEmployees=1;
        //accList.add(acc);
        insert accList;
        
      	Test.StartTest(); 
        ApexPages.StandardSetController sscTest = new ApexPages.StandardSetController(accList);

        AccountDataTableVF5 clsTest = new AccountDataTableVF5(sscTest);
		
        Test.stopTest(); 
           

	}
}