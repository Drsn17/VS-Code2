public with sharing class OLIGet     
{
    public list<WrapperTest> wrpTest=new list <WrapperTest>();
   	public list<OpportunityLineItem> oliList= new list<OpportunityLineItem>();

    Map<Id,OpportunityLineItem> mapId = new Map<Id,OpportunityLineItem>();
    public OLIGet(ApexPages.StandardController controller){  
        
    }
    public List<WrapperTest> getProducts()
    {
    	Id oppId =ApexPages.currentPage().getParameters().get('id');
        wrpTest.clear();
        for(OpportunityLineItem o : [select Id,Quantity,ListPrice,PricebookEntry.Product2Id,PricebookEntry.Name,unitprice from OpportunityLineItem  where OpportunityID=:oppId])
        {
        	WrapperTest w= new WrapperTest(o);
            if(mapId.get(o.Id) != null)
            {
            	w.selected = true;
                wrpTest.add(w);  
            }
        }
        return wrpTest;
	}
    
    public PageReference getSelected()
    {
        oliList.clear();
        for(WrapperTest wt : wrpTest)
        {
        	if(wt.selected == true)
        	{
            	oliList.add(wt.gst);
            	mapId.put(wt.gst.id, wt.gst);
        	}
        }
        	return null;
    } 
    
    public List<OpportunityLineItem> newProducts()  
    {
        System.debug('oliList:::::::'+oliList);
        if(oliList.size()>0)
      	return oliList;
        else
      	return null;
    } 
    
    public void newQuote() {
        ID oppId = ApexPages.currentPage().getParameters().get('ID'); 
        List<Id> selectedId = new List<Id>();
        opportunity opp=[select pricebook2id from opportunity where id =:oppId limit 1];
        Quote qu=new Quote();
        qu.name='Quate1'+oppId;
        qu.opportunityid=oppId;
        qu.pricebook2id=opp.pricebook2id;
      	insert qu; 
        
        List<QuoteLineItem> qliList=new List<QuoteLineItem>();
        for(OpportunityLineItem oli2: oliList) 
        {            
        	QuoteLineItem qli=new QuoteLineItem();
    		qli.pricebookentryid= oli2.pricebookentryid;
            qli.quantity=oli2.Quantity;
            qli.unitprice=oli2.UnitPrice;
            qli.product2id=oli2.PricebookEntry.Product2Id;
            qli.QuoteId=qu.id;
            qliList.add(qli);
        }  
        if(qliList.size()>0){
            insert qliList;
        }
    }

	public class WrapperTest
    {
    	public OpportunityLineItem gst{get;set;}
        public Boolean selected{get;set;}
        public WrapperTest(OpportunityLineItem o)
        {
            gst=o;
            selected=false;  
        }    
    }
}