@isTest
public with sharing class Script14_test {
	@isTest static void productTest()
	{

    	PriceBook2 pbb =new Pricebook2(Id = Test.getStandardPricebookId(), isActive=true);
       
        update pbb;
        
		list<Product2> PrList=new list<Product2>();
		for(integer i=0;i<5;i++)
		{
			Product2 pr=new Product2();
			pr.name='Almiya';
            pr.Description='Product1';
			prList.add(pr);
		}
		if(prList.size()>0)
		{
			insert prList;
		}
		test.startTest();
		Script14.display();
		test.stopTest();  
	}
	
    
}