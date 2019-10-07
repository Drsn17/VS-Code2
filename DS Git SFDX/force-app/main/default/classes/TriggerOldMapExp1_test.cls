@isTest
public class TriggerOldMapExp1_test {
	@isTest static void test()
    {
        list<Opportunity> oppList=new list<Opportunity>();
        list<Opportunity> oppNewList= new list<Opportunity>();
        map<id,Opportunity> oldMap=new map<id,Opportunity>();
        for(integer i=0;i<10;i++)
        {
            Opportunity opp=new Opportunity();
            opp.name='My Opp';
            opp.CloseDate=date.today();
            opp.StageName='Closed Won';
            oppList.add(opp);
        }
        if(oppList.size()>0)
        {
            insert oppList;
        
        for(Opportunity o:oppList)
        {
            Opportunity oppnew=new Opportunity();
            oppnew.id=o.id;
            oppnew.name=o.name;
            oppnew.CloseDate=o.closeDate;
            oppnew.StageName=o.StageName;
            oppNewList.add(oppnew);
        }
            
        if(oppNewList.size()>0)
        {
            for(Opportunity o1:OppNewList)
            {
                if(oldMap.get(o1.id) == null)
                {
                    oldmap.put(o1.id,o1);
                }
            }
        }
            for(Opportunity opp12:OppList)
            {
                opp12.StageName = 'closed lost';
            }
            test.startTest();
                update opplist;
            test.stopTest();
        
    }
}
}