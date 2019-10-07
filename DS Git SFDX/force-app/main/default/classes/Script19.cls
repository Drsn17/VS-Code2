public with sharing class Script19 {
    public static void addCase()
        {
        List<Case> caseList=new List<Case>();
        List<Account> accList=new List<Account>();
        List<Contact> contList=new List<Contact>();
        accList=[select Id, Name from Account where name like '%account%' limit 5];
        contList=[select Id, LastName from Contact where LastName like '%singh%' limit 5];
        
        for(integer i=0;i<5;i++)
        {
            Case cs=new Case();
            cs.Origin='Web';
            cs.Status='Working';
            cs.AccountId=accList.get(i).id;
            cs.ContactId=contList.get(i).id; 
            caseList.add(cs);
        }   
        insert caseList;
        System.debug('Case'+caseList);
    }  
}