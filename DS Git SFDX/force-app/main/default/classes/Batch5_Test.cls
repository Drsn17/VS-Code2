@isTest
public class Batch5_Test {
    @isTest static void Scheduler_test()
    { 
        Test.startTest();
        list<Opportunity> oppList = new list<Opportunity>();
        for(integer i=0;i<5;i++)
        {
            Opportunity opp=new Opportunity();
            opp.name='Test'+i;
            opp.StageName='Closed Won';
            opp.CloseDate=date.today();
            oppList.add(opp);
        }
    	Insert oppList;

        Batch5 obj = new Batch5();
        String cron='0 0 0/6 1/1 * ? *';  
        System.schedule('delete', cron ,obj);

        Test.stopTest();
    }

}