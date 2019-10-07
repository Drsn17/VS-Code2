public with sharing class Script3 {
	public static void add()
	{
		List<Opportunity> oppList=new List<Opportunity>();
		for(integer i=0;i<20;i++)
		{
			Opportunity opp=new Opportunity();
			opp.Name='Darshan'+i;
			opp.StageName='Open';
			opp.CloseDate=date.newInstance(2017, 10, 17);
			oppList.add(opp);
		}
		insert oppList;
	}
    
}