@isTest
public with sharing class Script4_test {
	@isTest static void test()
    {
        Id pb2 = Test.getStandardPricebookId();
    	PriceBook2 pbb =new Pricebook2();
        pbb.id =  pb2;
        update pbb;
    	test.startTest();
    	Script4.add();
    	test.StopTest();
    }     
}