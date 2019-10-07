public with sharing class AccountSaurabhController {
   
    @auraenabled
    public static List<Account> AccountSaurabhController(string newlist){
        {
            Account obj = (Account)JSON.deserialize(newlist, Account.class);

            insert obj;
            
            List <Account> returnlist = new list <Account>();
            returnlist= [SELECT name , NumberOfEmployees , Phone , AccountNumber
                      FROM Account ORDER BY createdDate ASC];
            return returnlist;
           
        }
        
    }
   
}