@isTest
public class TriggerOldMapExp_test {
    @isTest static void test()
    {
        list<Opportunity> oppList=new list<Opportunity>();
        for(integer i=0;i<5;i++)
        {
            Opportunity opp=new Opportunity();
            opp.Name='Oportunity Test';
            opp.closeDate=date.today();
            opp.stageName='CloseDate';
            oppList.add(opp);
        }
        insert oppList;
    }

}