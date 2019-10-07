public with sharing class Script20 {
		public static void attchment1()
    {
    	list<Account> ac=new list<Account>();

    	ac=[select id from Account where name like '%dsa%' limit 1];
    	
    	list<Contact> c=new list<Contact>();
    	c=[select id from Contact where AccountId in :ac];
    	
    	List<Attachment> atList=new List<Attachment>();
    	
    		atList=[select id, name, body from Attachment where ParentId in : ac];
    		List<Attachment> newAtt= new List<Attachment>();
    		
    		for(Attachment at1:atList) 
    		{
    				Attachment a=new Attachment();
    				a.Name=at1.Name;
    				a.Body=at1.Body;
    				a.ParentId =c[0].Id;
    				newAtt.add(a); 			
    		}
    		insert newAtt;
    	 
          	
    }
    
}