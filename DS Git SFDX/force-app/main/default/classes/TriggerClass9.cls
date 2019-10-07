public with sharing class TriggerClass9 {
	public static void comp_test(List<Campaign>c_list)
	{
		
		List<Campaign> comList=[select id from Campaign where id in:c_list and Status='Completed']; 
		System.debug('Campaign-------------------->>>>>>>>'+comList);
		if(comList.size()>0)
		{
		List<Opportunity> oppList=[select id from Opportunity where CampaignId in:comList];
		System.debug('Opportunity-------------------->>>>>>>>'+oppList);
		if(oppList.size()>0)
		{
		list<OpportunityLineItem> oliList=[select OpportunityID,Product2id from opportunityLineItem where OpportunityId in:oppList];
			
			map<id,Integer> map_id=new map<id,Integer>();
			
			for(OpportunityLineitem oli:oliList)
			{  
				if(!map_id.containskey(oli.OpportunityId)) 
				{
					map_id.put(oli.OpportunityId,0);
				}
				integer a=map_id.get(oli.OpportunityId);
				a=a+1;
				map_id.put(oli.OpportunityId,a);
			}
			List<Opportunity>op_new_List=new List<Opportunity>();  
			for(Opportunity op:oppList)
			{
				Opportunity op1=new Opportunity();
				op1.id=op.id;
				if(map_id.get(op1.id)!=null)
				op1.stageName='Closed Won';
				else
				op1.stageName='Closed Lost';
				
				op_new_List.add(op1);
				
			}
			update op_new_List;
	}

}
}
}