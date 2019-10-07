public with sharing class Script5 {
    public static void display()
    {
    	List<Account> accList=new list<Account>();
    	accList=[Select name from Account where name like 'Darshan%'];
    	
    		if(accList.size()>0)
    		{
    		System.debug('Account List >>>>> '+accList);
    		delete accList;
    		system.debug('Deleted');
    		}
  		
    		
    	
    	
    }
}