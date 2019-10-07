public with sharing class OrderClass {
    public static void orderCopy(list<Opportunity> oppList)
    {
		set<id> acc_Id= new set<id>();
        for(Opportunity opp:oppList)
        {
            if(opp.AccountId==null)
            {
                acc_Id.add(opp.AccountId);
            }
        }
        List<OpportunityLineItem> oliList = new List<OpportunityLineItem>([SELECT Description,Id,ListPrice,Name,OpportunityId,Product2Id,ProductCode,Quantity,TotalPrice,UnitPrice FROM OpportunityLineItem where OpportunityId IN :OppList and Opportunity.AccountId in :acc_id]);
        set<id> pbId= new set<id>();
        for(OpportunityLineItem oli1: oliList)
        {
            pbId.add(oli1.PricebookEntryId);
        }
        list<PricebookEntry> pnList=[select Pricebook2Id,Id from PricebookEntry where id in : pbId];
        list<Order> orderList=new list<Order>();
        list<OrderItem> itemList=new list<OrderItem>();
        for(Opportunity opp:oppList)
        {
           if(oliList.size()>0 && opp.stageName=='Send Order')
        	{
                order o=new order();
                o.Account.Name=opp.Account.Name;
                o.OpportunityId=opp.Id;
                o.EffectiveDate=date.today();
                orderList.add(o);
            }
            insert orderList;

            for(OpportunityLineItem oli:oliList)
            {
                OrderItem oitem=new OrderItem();
              //oitem.ListPrice=oli.ListPrice;
                oitem.Product2Id=oli.Product2Id; 
                //oitem.Name=oli.Name;
                oitem.Quantity=oli.Quantity; 
                oitem.UnitPrice=oli.UnitPrice;
                
                itemList.add(OItem);
                               
            }
            insert itemList;

        }
    }

}