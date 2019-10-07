public with sharing class TQS3 {
    public static void OppError(List<OpportunityLineItem> olilist)
    {
        System.debug(olilist);
        
        Set<ID> op_id=new Set<ID>();
        for(OpportunityLineItem oli:olilist)
        {
            op_id.add(oli.OpportunityID);
        }
        
        List<OpportunityLineItem> oliList1=[Select OpportunityID from OpportunityLineItem where OpportunityID IN :op_id];
        
        map<Id,Integer> map_id=new map<ID,Integer>();
        for(OpportunityLineItem oli:olilist1)
        {
            if(!map_id.containsKey(oli.OpportunityID))
            {
                map_id.put(oli.OpportunityID, 0);
            }
        Integer temp=map_id.get(oli.OpportunityID);
        temp=temp+1;
        map_id.put(oli.OpportunityId,temp);
        }   
        System.debug(map_id);
        
        for(OpportunityLineItem oli: olilist)
        {
            if(map_id.containsKey(oli.OpportunityID))
            {
                if(map_id.get(oli.OpportunityID)>1)
                {
                    oli.addError('you cannot enter more than 2 oli for  1 opportunity');
                }
            }
        }
    } 
}