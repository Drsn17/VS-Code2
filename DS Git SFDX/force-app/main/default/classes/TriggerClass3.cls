public with sharing class TriggerClass3 {
	public Static void add(List<Product2> pList)
	{
		if(pList.size()>0)
		{
			
			Pricebook2 pb2=[select Id from Pricebook2 where isStandard=true];
			List<PricebookEntry>pbeList=new List<PricebookEntry>();
			for(Product2 p:pList)
			{
				PricebookEntry pbe=new PricebookEntry();
				pbe.Product2Id=p.id;
				pbe.Pricebook2Id=pb2.id;
				pbe.UnitPrice=1;
				pbeList.add(pbe);
			}
			if(pbeList.size()>0)
			{
				insert pbeList;
			}
			 
		}
	}
}