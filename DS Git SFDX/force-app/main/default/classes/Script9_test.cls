@isTest
public class Script9_test {
    @isTest static void userTest() {
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='darshan.singh@cloudanalogy.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='darshan.singh@cloudanalogy.com');          
        Test.startTest();
        Script9.display();
        Test.stopTest();
    }
}