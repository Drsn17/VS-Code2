@isTest
public class Script21_test {
    @isTest static void test()
    {   
     Opportunity opp=new Opportunity();
     opp.Name='Darshan2ff'; 
     opp.StageName='Closed Won';
     opp.CloseDate=date.today()+2;
     insert opp;
     
     Product2 pro=new Product2();
     pro.Name='Productsau';
     insert pro;
     
     //ID pb = test.getStandardPricebookId(); 
        
        PriceBook2 pb1 = new PriceBook2();
        pb1.IsActive = true;
        pb1.Name='MSD';
        insert pb1;
        
        PricebookEntry pbe=new PricebookEntry();
        pbe.Product2Id=pro.Id;
        pbe.PriceBook2Id=test.getStandardPricebookId(); 
        pbe.UnitPrice=200;
        pbe.IsActive=true;
        insert pbe;
          
     
     OpportunityLineItem oli=new OpportunityLineItem();
     oli.OpportunityId=opp.Id;
     oli.PricebookEntryId=pbe.Id;
     oli.Quantity=3;
     oli.UnitPrice=2;
     insert oli;
        
      test.startTest();
      Script21.clonetest();
      test.stopTest();
    } 
 }