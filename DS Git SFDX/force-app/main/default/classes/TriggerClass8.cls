public with sharing class TriggerClass8 {
    public static void add1(List<Opportunity> oppList)
    {
       // List<Opportunity> oppList1 = [Select id,accountid from Opportunity where ID IN :oppList and Accountid!=null];
        
        set<id> acc_id = new set<id>();
            for(Opportunity opp:oppList)
            {
                if(opp.AccountId != null)
                {
                	acc_id.add(opp.AccountId);
                }
            }        
               if(acc_id.size()>0)
               {
            list<Contact> conList=[select id,AccountId from Contact where AccountId in : acc_id];
                      
            list<OpportunityContactRole> ocrList=new list<OpportunityContactRole>();
            
            map<id,List<Contact>> map1=new map<id,List<Contact>>();
            
           	for(Opportunity opp1:oppList)
           		{
                for(Contact con:conList)
                {
                    if(opp1.accountId==con.accountid)
                    {
                        if(!map1.containskey(opp1.id))
                        {
                            map1.put(opp1.id,new List<Contact>());
                        }
                        map1.get(opp1.id).add(con);
                       	map1.put(opp1.id,map1.get(opp1.id));
                    }
                }
          	}
            
            for(Opportunity opp2:oppList)
            {
                for(Contact con1:map1.get(opp2.id))
                {
                    OpportunityContactRole ocr=new OpportunityContactRole();
                    ocr.OpportunityId=opp2.id;
                    ocr.contactid=con1.id;
                    ocrList.add(ocr);
                }  
            }
            
            if(ocrList.size()>0){
            insert ocrList; 
           }
        }  
}
}