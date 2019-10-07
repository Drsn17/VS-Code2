public with sharing class TriggerClass5 {
	public static void delName(List<Contact> conList)
	{
		set<id> ac_id=new Set<id>();
		for(Contact con:conList)
		{
			if(con.Accountid!=null)
			{
				ac_id.add(con.AccountId);
			}
		}
		
		List<Account>accList=[select Name from Account where id in:ac_id];
		List<Account> accNewList=new List<Account>();
		
		Map<Id,String> acc_map=new map<Id,String>();
		
		for(Account acc:accList)
		{
			acc_map.put(acc.id,acc.name);
		}
		
		for(Contact con:conList)
		{
			if(con.AccountId!=null)  
			{
				String str=acc_map.get(con.AccountId); 
				str=str.remove(con.LastName);
				acc_map.put(con.AccountId,str); 
			}
		}
		for(ID i:acc_map.keySet())
    	{
    		Account a=new Account();
    		a.ID=i;
    		a.Name=acc_map.get(i);
    		accnewList.add(a);
    	}
    	
    	if(accnewList.size()>0)
    	{
    		 	update accnewList; 
    	}
   
		
		
		
				
		
	/*	List<Account>acList=New List<Account>();
		for(Contact con:[select Account.Name, Account.ID, LastName from Contact where id in :conList])
		{
			Account ac=new Account();
			ac.id=con.id;
			String str1=con.Account.name;
			String str2=con.LastName;
			String str3=str1+str2;
			ac.name=str3;
			ac.name=con.Account.Name.remove(con.LastName);
			acList.add(ac);
		}
		if(acList.size()>0)
		{
			update acList; 
			
		}*/
	}
    
}