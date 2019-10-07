public class AccountController1 {
    @auraEnabled
    public static list<Account> findAll()
    {
        return [Select Id,Name,Phone from Account limit 10];
    }

}