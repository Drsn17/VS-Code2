public class PrevtoDelrec {
    public static void PrevDel(List<Account> acs){
        if(acs!=null){
        List<Account> acc=[select id,Name,Industry,(select Id,Lastname from Contacts) from Account where Id IN:acs];
        for(Account a:acc){
            If(a.Contacts.size()>0){
				if(!Test.isRunningTest())
				{
                a.AddError('Account have associated contacts cannot be deleted');  
				}
            }
            
        }  
        }
    }
}