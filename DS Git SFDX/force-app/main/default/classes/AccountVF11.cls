public class AccountVF11 {
    public String searchAccount { get; set; }
    public Account accounts{get;set;}
    Public list<Account> acc{get;set;}

    public PageReference search()  
    {

        accounts = [SELECT id,name, ParentId, Parent.Name FROM Account WHERE Parent.Name =:searchAccount limit 1 ];
        acc = [SELECT name, Parent.Name FROM Account WHERE ParentId =: Accounts.ParentId];
        
        return null;  
    }

}