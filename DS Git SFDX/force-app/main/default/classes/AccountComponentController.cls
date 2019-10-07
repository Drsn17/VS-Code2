public class AccountComponentController {
    @AuraEnabled
    public static Account getAcc()
    {
        Account ac=new Account();
        ac=[select id, Name, Phone from Account limit 10]; 
        return ac; 
    }
 
}