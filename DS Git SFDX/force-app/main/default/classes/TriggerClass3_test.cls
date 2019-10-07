@isTest
public with sharing class TriggerClass3_test {
    @isTest static void test()
    {
    	
    	Id pb2 = Test.getStandardPricebookId();
    	PriceBook2 pbb =new Pricebook2();
        pbb.id =  pb2;
        update pbb;
        
        
    	list<Product2> prlist=new list<Product2>();
    	for(integer i=0;i<10;i++)
    	{
    		Product2 pr=new Product2();
    		pr.Name='Book'+i;
    		pr.IsActive = true;
    		prlist.add(pr);
    	}
    	insert prlist;
    	
    	
    	
    }
}