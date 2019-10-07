global class Batch7 implements Database.Batchable<sObject> {

	global Database.QueryLocator start(Database.BatchableContext bc)
	{  	
      	String query='select id,accountid from contact where accountid!=null';
    	return Database.getQueryLocator(query);
  	}
 	global void execute(Database.BatchableContext bc,List<Contact> scope){
 		if(scope.size()>0){
 			Map<Id,Integer> map_ID=new Map<Id,Integer>();
 			Integer temp;
 			for(Contact con:scope){
 				if(!map_id.containskey(con.accountid))
 				{
 					map_id.put(con.accountid,1);
 				}
 				else{
 					temp=map_id.get(con.accountid);
 					temp=temp+1;
 					map_id.put(con.accountid,temp);
 				}
 			}
 			List<Account> acclist=[Select id from account where ID IN :map_id.keySet()];
 			if(acclist.size()>0)
 			{
 				for(Account acc:acclist)
 				{
 					acc.Count__c=map_id.get(acc.id);	
 	    		}
 	    		update acclist;
 			}
 		}
 	}
 	global void finish(Database.BatchableContext bc)
 	{	
    }
}