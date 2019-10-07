public with sharing class TriggerClass4 {
    public static void add(List<Contact> conList) 
    {
    	Set<id> ac_id=new Set<id>();
    	for(Contact c:conList)
    	{
    		if(c.AccountId!=null) 
    		{
    			ac_id.add(c.AccountId); 
    		}
    	}
    	List<Contact> conList1=[Select LastName, AccountID, Account.Name from Contact Where AccountID IN :ac_id];
    	
    	Map<id,String> Account_map=new Map<id,String>();
    	for(Contact c1:conList1)
    	{
    		if(!Account_map.containsKey(c1.AccountId))
    		{
    			Account_map.put(c1.AccountId,c1.Account.Name+c1.LastName);
    		 }
    		 else
    		 {
    		 	String str=Account_map.get(c1.AccountId); 
    		 	Account_map.put(c1.AccountId,str+c1.LastName);  
    		 }
    	}
    	  	
    	List<Account> acclist=new List<Account>();    
        	for(ID i:Account_map.keySet())
        	{
        		Account acc=new Account();
        		acc.ID=i;
        		acc.Name=Account_map.get(i);
        		acclist.add(acc);
        	}
        	update acclist;
        	
        	if(acclist.size()>0)
        	{
        		
   	    	}
    	
    	
       /* if(conList.size()>0)
        {
            List<Account> acList=new List<Account>();
            Contact c=[select Account.Name,LastName from Contact where id in:conList];
            for(Contact con:conList)
            {
                Account ac=new Account();
                ac.id=con.AccountID;
                ac.Name=c.Account.Name+c.LastName; 
                acList.add(ac);
            }
            if(conList.size()>0)
            {
                update acList;
            }
        }*/
    }
}