@isTest
public class VisualForce1_test {
	@isTest static void test()
    {
        Account acc=new Account();
        acc.name='test';
        acc.NumberOfEmployees=1;
        insert acc;
        
      Test.StartTest(); 
      ApexPages.StandardController sc = new ApexPages.StandardController(acc);
      //myControllerExtension testAccPlan = new myControllerExtension(sc);
    
      PageReference pageRef = Page.VisualForce1; // Add your VF page Name here
      pageRef.getParameters().put('id', String.valueOf(acc.Id));
      Test.setCurrentPage(pageRef);
    
      //testAccPlan.save(); call all your function here
     Test.StopTest();
    }
}