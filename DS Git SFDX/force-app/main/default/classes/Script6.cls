public with sharing class Script6 {
	public static void display()
	{
		List<Opportunity> opList=new List<Opportunity>();
		List<Opportunity> opListToUpdate=new List<Opportunity>();
		opList=[select Name from Opportunity where closeDate > today];
		if(opList.size()>0)
		{
			System.debug('Opprotunity'+opList);
			for(Opportunity opp:opList)
			{
				Opportunity op = new Opportunity();
				op.id = opp.id;
			op.Name=opp.Name+'f';
			opListToUpdate.add(op);
			}
		}
		update opListToUpdate;
		System.debug('name'+ opListToUpdate);
	}
     
}