@isTest()
public class Batch1Test {

    static testMethod void myUnitTest() {
    	
    	Account account1 = new Account (name='test_Account1');
    	Insert account1;
    	
    	
        Test.StartTest();

        Batch1 obj = new Batch1();
     	
     	Database.executeBatch(obj);
	    
	    Test.StopTest();   
       
    }
}