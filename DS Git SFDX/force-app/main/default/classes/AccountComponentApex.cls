public class AccountComponentApex {
    @AuraEnabled
    public static Account getAcc()
    {
        Account ac=new Account();
        ac=[select id, Name, Phone from Account limit 1]; 
        return ac; 
    }
 
}