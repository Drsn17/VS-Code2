public with sharing class TriggerOldMapExp {
	public static void CheckStageName(List<Opportunity> NewOppList, Map<Id, Opportunity> OldMap)
    {
    	for(Opportunity opp : NewOppList) 
        {
      	if(OldMap.get(opp.Id).StageName !=  Opp.StageName ){
        opp.Name='Updated Old Map';
        }
          
        }

    }
}