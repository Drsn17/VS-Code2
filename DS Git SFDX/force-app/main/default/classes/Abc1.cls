public class Abc1
{
    list<AccountWrapper> wraplist=new list<AccountWrapper>();  
    public abc1()
    {
        list<Account> acclist=[SELECT CreatedbyID, Account.Name,(SELECT      
                name,Contact.FirstName, Contact.LastName 
                FROM Account.Contacts) FROM Account limit 10];  
       Map<Id, AccountWrapper> accMap=new Map<Id, AccountWrapper>();
       for(account a: accList)
       {
           AccountWrapper accWrap=accMap.get(a.CreatedByID);
           if (null==accWrap)
           {
              accWrap=new AccountWrapper();
              accMap.put(a.CreatedByID, accWrap); 
              accWrap.userId=a.CreatedById;
           }

           accWrap.accounts.add(a);
       }

       wrapList=accMap.values();
   }

   public list<AccountWrapper> getaccounts()
   {
      return wraplist;
   }

   public class AccountWrapper
   {
      public Id userId {get; set;}
      public List<Account> accounts {get; set;}
      public AccountWrapper()
      {
         accounts=new List<Account>();
      }
   }
}