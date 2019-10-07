public with sharing class ScriptTest2 {
    public static void add()
    {
        list<Opportunity>opList=[select id,name from Opportunity where stagename='Closed Won'];
        set<id> op_id=new set<id>();
        for(Opportunity opp:oplist)
        {
              op_id.add(opp.id);
        }
        list<OpportunityLineItem> oliList= [select TotalPrice,Product2.name from OpportunityLineItem where OpportunityId =: op_id and Product2.name like '%Gandhiji%'];
        for(OpportunityLineItem oli:oliList)
        {
              System.debug('Product Name=' + oli.Product2.name + ' '+ 'TotalPrice' +oli.TotalPrice);
        }
        } 
}