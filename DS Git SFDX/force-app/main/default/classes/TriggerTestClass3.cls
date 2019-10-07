public with sharing class TriggerTestClass3 {
    public static void add(List<Account> accList)
    {
        set<id> accId=new set<id>();
        for(Account acc:accList)
        {
            if(acc.NumberOfEmployees>100)
            {
                accId.add(acc.id);
            }
        }
        if(accid.size()>0)
        {
        List<Contact> conList=new list<Contact>();
        for(Id a:accId)
        {
            Contact con=new contact();
            con.AccountId=a;
            con.lastName='My contact';
            conList.add(con);
        }
        if(conList.size()>0)
        insert conList;
        system.debug('Contact------------------------------------'+conList);
        
            
        List<Opportunity> oppList=new List<Opportunity>();
        for(Id id_a:accId)
        {
            Opportunity opp=new Opportunity();
            opp.Accountid=id_a;
            opp.name='My Opportunity';
            opp.closeDate=date.newInstance(2017, 10, 17);
            opp.stageName='Close Won';
            oppList.add(opp);
         }
         insert oppList;
         
         List<case> cList=new list<case>();
         list<AccountContactRole> acrList= new list <AccountContactRole>();
         for(Contact c:conList)
         {
         for(Id a:accId)
        	{
            case cs=new case();
            cs.Accountid=a;
            cs.Contactid=c.id;
            cs.Subject='My Cases';
            cs.status='New';
            cs.origin='Phone';
            cList.add(cs);
            
            AccountContactRole acr=new AccountContactRole();
                acr.AccountId=a;
                acr.contactid=c.id;
                acrList.add(acr);
              }
        }
        if(acrList.size()>0){
        insert cList;
        insert acrList; 
        }
        
     
   
              }
            }
            
            
        }