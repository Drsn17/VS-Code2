@isTest()
public class Batch4_Test {

    static testMethod void myTest() {
        
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
        
        
        Test.StartTest();

        Batch4 obj = new Batch4();
        
        Database.executeBatch(obj);
        
        Test.StopTest();   
       
    }
}