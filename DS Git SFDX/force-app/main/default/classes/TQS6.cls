public with sharing class TQS6 {
    public static void oppError(list<Opportunity> oppList)
    {
        list<Account> accList=[select Name,Id from Account where QS6__c includes ('ASIA')];
        System.debug('Account:----'+ accList);
        
        list<Opportunity> oppNewList=[Select Id, AccountId From Opportunity Where StageName='Closed Won' and AccountId IN:AccList];
 		System.debug('Opportunty------'+oppNewList);
        for(Opportunity opp: oppList)
        {
            Integer add=0;
			for(Opportunity opp1:OppnewList){
 			if(opp1.AccountId==Opp.AccountId)
            {
   				add++;
        	} 
    	}
        if(add>1){
  			Opp.addError('CAN NOT ADD OR UPDATE NEW OPPORTUNITY !!');
 			System.debug('AFTER MATCH------------------------>'+Opp.AccountId);
		}
	}
    }
}