public with sharing class TriggerClass7 {
    public static void m1(List<Opportunity> oppList)
 {List<Opportunity> opid=[select id from Opportunity where id in:oppList and stagename='Closed Won'];
  if(opid.size()>0)
  {
  List<OpportunityLineItem>oliList=[select OpportunityId,product2Id,Quantity from OpportunityLineItem where OpportunityId in : opId];
  if(oliList.size()>0)
  {
  Map<id,Double>mapid=new Map<id,Double>();
  if(oliList.size()>0)
  {
   for(OpportunityLineItem oli: oliList) 
   {
    if(!mapid.containsKey(oli.product2Id))
    {
     mapid.put(oli.Product2Id,oli.Quantity);      
    }
   }
   
   List<Product2> prList=new List<Product2>();   
        for(ID pr_id:mapid.keySet())
       {
        Product2 p=new Product2();
        p.ID=pr_id;
        p.No_Of_Product_Sold__c=mapid.get(pr_id);
        Prlist.add(p);
      }
      update Prlist;
   
  }
  
  
 } 
 }  
    
}
}