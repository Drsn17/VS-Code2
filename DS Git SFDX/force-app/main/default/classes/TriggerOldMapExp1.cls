public with sharing class TriggerOldMapExp1{
 public static void CheckStageName(List<Opportunity> NewOppList, Map<Id, Opportunity> OldMap)
    {
        list<Opportunity> oppuplist=new list<Opportunity>();
        system.debug('-----------------------------'+NewOppList);
     for(Opportunity opp : NewOppList) 
        {
     //Opportunity OppOld = new Opportunity();
     //OppOld = OldMap.get(opp.Id);
     if(OldMap.get(opp.Id).StageName !=  Opp.StageName ){
            system.debug('-----------------------------'+OldMap.get(opp.Id).StageName);
            
            system.debug('-----------------------------'+Opp.StageName);
            Opportunity opp1=new Opportunity();
            opp1.id=opp.id;
            opp1.Name='Updated123';
            oppuplist.add(opp1);  
        }
    }
        if(oppuplist.size()>0)
        {
            system.debug('-----------------------------'+oppuplist);
     update oppuplist;
        }
   // if(OldMap.get(opp.Id).StageName != Opp.StageName ){
      
    // }
    }
}