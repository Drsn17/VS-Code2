@isTest
public class Batch2_Test {
    @isTest static void Scheduler_test()
    { 
        Test.startTest();
        Account accList=new Account();
        accList.Name ='Name';
        accList.NumberOfEmployees=1;

        insert accList;

        Batch2 obj = new Batch2();
        String cron='0 0 12 1/1 * ? *';
        System.schedule('delete', cron ,obj);

        Test.stopTest();
    }

}