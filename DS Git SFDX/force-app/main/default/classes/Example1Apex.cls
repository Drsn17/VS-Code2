public class Example1Apex {    
    public class OpportunityLineItemwrapper
    {
        public OpportunityLineItem prd{get; set;}
        public Boolean selected {get; set;}
        public OpportunityLineItemwrapper(OpportunityLineItem a)
        {
            prd = a;
            selected = false;
        }
    }
    List<OpportunityLineItemwrapper> OppList = new List<OpportunityLineItemwrapper>();
    List<OpportunityLineItem> selectedProducts = new List<OpportunityLineItem>();

    Map<Id,OpportunityLineItem> selectedProductsMap = new Map<Id,OpportunityLineItem>();
    public Example1Apex(ApexPages.StandardController controller) {
    }
     public List<OpportunityLineItemwrapper> getProducts() {
        ID str = ApexPages.currentPage().getParameters().get('ID');         
        OppList.clear();
        for(OpportunityLineItem a : [Select Id,Quantity,ListPrice,PricebookEntry.Product2Id,PricebookEntry.Name,unitprice From OpportunityLineItem where Opportunity.id=:str]){
            OpportunityLineItemwrapper opplineItem = new OpportunityLineItemwrapper(a);            
            if (selectedProductsMap.get(a.Id) != null)
                opplineItem.selected = true;
             OppList.add(opplineItem);        
        }
        return OppList;
    }
    
    public PageReference getSelected() {
        selectedProducts.clear();
        for(OpportunityLineItemwrapper accwrapper : OppList)
        if(accwrapper.selected == true) {
            selectedProducts.add(accwrapper.prd);
            selectedProductsMap.put(accwrapper.prd.id, accwrapper.prd);
        }
        return null;    
        
    }
    
    public List<OpportunityLineItem> GetSelectedProducts()  {
        if(selectedProducts.size()>0)
      return selectedProducts;
        else
      return null;
    } 
    public void createQuote() {
        ID str = ApexPages.currentPage().getParameters().get('ID'); 
        List<Id> SelectedIds = new List<Id>();
        opportunity pb=[select pricebook2id from opportunity where id =:str limit 1];
        Quote newquote=new Quote(name='NewQuote'+str,opportunityid=str,pricebook2id=pb.pricebook2id);
      insert newquote;  
        List<QuoteLineItem> quoteli_list=new List<QuoteLineItem>();
        for(OpportunityLineItem litem: selectedProducts) {            
                QuoteLineItem quoteli=new QuoteLineItem();
    quoteli.pricebookentryid= litem.pricebookentryid;
             quoteli.quantity=litem.Quantity;
             quoteli.unitprice=litem.UnitPrice;
             quoteli.product2id=litem.PricebookEntry.Product2Id;
             quoteli.QuoteId=newquote.id;
             quoteli_list.add(quoteli);
        }  
        if(quoteli_list.size()>0){
            insert quoteli_list;
        }
    }
    
    
}