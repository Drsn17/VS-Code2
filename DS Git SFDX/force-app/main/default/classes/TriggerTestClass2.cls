public with sharing class TriggerTestClass2 {
	public static void add(List<OpportunityLineItem> oppList)
    {
    /*  set<Id> op_id=new set<id>();
        
        for(Opportunity opp:oppList)
        {
            if(opp.opportunityId !=null && opp.StageName == 'Closed Won')
            {
                op_id.add(opp.Id);
            }
        }*/
        List<OpportunityLineItem> oli_id=[select id,Product2Id,TotalPrice from OpportunityLineItem where id in:oppList and Product2.Name like '%Gandhiji%'];
        
      //  List<Product2>prList=[select TotalPrice from Product2 where OpportunityLineItemId in : oli_Id];
        //if(oli_id.size()>0)
       // {
        Map<id,Double>map_id=new Map<id,Double>();
        if(oli_id.size()>0)
        {
           for(OpportunityLineItem oli:oli_id) 
            {
                if(!map_id.containsKey(oli.product2Id))
                {
                    map_id.put(oli.Product2Id,oli.TotalPrice);      
                }
            }
            
            List<Product2> prList=new List<Product2>();   
            for(ID pr_id:map_id.keySet())
            {
            Product2 p=new Product2(); 
            p.ID=pr_id;
            p.Total_Price_Sold__c=map_id.get(pr_id);
            Prlist.add(p);
      }
      update Prlist;
            
        }
        
        
    
    }
    }