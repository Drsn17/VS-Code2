@isTest
public class Script15_test {
    @isTest static void test()
    {

    	Id pb2 = Test.getStandardPricebookId();
    	PriceBook2 pbb =new Pricebook2();
        pbb.id =  pb2;
		update pbb;
              
        test.startTest();  
        Script15.add();
        test.stopTest(); 
     
        
    }

}