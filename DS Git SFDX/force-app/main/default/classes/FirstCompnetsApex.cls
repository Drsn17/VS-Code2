public class FirstCompnetsApex {
    @AuraEnabled
    public static Account getAcc()
    {
        Account ac=new Account();
        ac=[select id,Name from Account limit 1]; 
        return ac; 
    }

}