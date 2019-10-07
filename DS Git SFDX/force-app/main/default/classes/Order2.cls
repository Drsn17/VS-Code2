public class Order2 {
    public static void orderTest(list <Opportunity> oppList)
    {
       
       
        list <OpportunityLineItem> oliList = [select id,unitprice,Description,quantity, PriceBookEntryId,OpportunityId,Product2Id from OpportunityLineItem where Opportunityid in:oppList];
        
        set<id> Pricebook_entry_id = new Set<Id>();
        for(OpportunityLineItem oli1 : oliList)
        {
            Pricebook_entry_id.add(oli1.PricebookEntryId);
        }
        
        list<PriceBookEntry> pr = [select pricebook2Id,id from PriceBookEntry where id in : Pricebook_entry_id];
     
        map<Id,Id> PricebookEntryIDD = new Map<Id,Id>();
        for(OpportunityLineItem oli2 : oliList)
        {
            PricebookEntryIDD.put(oli2.OpportunityId,oli2.PriceBookEntryId);
        }
       
        map<Id,Id> PriceBookMap = new Map<ID,ID>();
        for(PricebookEntry pb1 : pr)
        {
            PriceBookMap.put(pb1.ID,pb1.Pricebook2Id);
        }
        
        list<Order> orList = new list<Order>();
        list<OrderItem> oriList = new list<OrderItem>();
        if(oliList.size()>0)
        {
            for(Opportunity opp: oppList)
            {
                if(opp.stagename=='Send Order' && opp.HasOpportunityLineItem==true)
                {
                    order or1 = new order();
                    or1.name=opp.Account.name;
                    or1.Accountid=opp.Accountid;
                    or1.EffectiveDate=opp.CloseDate;
                    or1.status='Draft'; 
                    or1.OpportunityId=opp.id;
                    or1.Pricebook2Id=PriceBookMap.get(PricebookEntryIDD.get(opp.Id));
                    orList.add(or1);
                    
                }                
            }
            if(orList.size()>0)
            {
                insert orList;
                
                for(OpportunityLineItem oli : oliList)
                {
                    Orderitem Ot = new Orderitem();
                    Ot.orderid=orList[0].id;
                    Ot.UnitPrice=oli.UnitPrice;
                    Ot.Description=oli.Description;
                    Ot.Quantity=oli.Quantity; 
                    Ot.PriceBookEntryId=oli.PricebookEntryId;
                    Ot.Product2Id=oli.Product2Id;
                    oriList.add(Ot);
                }
                if(oriList.size()>0)
                {
                    insert oriList;
                }
            }
        }    
    }
}