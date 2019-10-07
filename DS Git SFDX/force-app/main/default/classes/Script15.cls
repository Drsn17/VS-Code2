public with sharing class Script15 {
	public static void add()
	{
		PriceBook2 pb=new PriceBook2();
		pb.name='Algo New Price Book1';
		pb.isActive=true;
		//priceList.add(pb);
		insert pb;
		system.debug(pb);
		
		List<Product2> pList=new List<Product2>();
		
		for(integer i=0;i<=10;i++)
		{
			Product2 pr=new Product2();
			pr.name='Mobile'+i;
			pr.isActive=true;
			pList.add(pr);
		}
		insert pList;
		system.debug(pList);
		
		PriceBook2 stpr=[select id from PriceBook2 where isStandard=true];
		
		List<PricebookEntry> pbeList=new List<PricebookEntry>();
		for(integer i=0;i<10;i++)
		{
			PricebookEntry pbe=new PriceBookEntry();
			pbe.PriceBook2Id=stpr.id;
			pbe.UnitPrice=13;
			//pbe.UseStandardPrice=true;
			pbe.Product2Id=pList.get(i).Id;
			pbeList.add(pbe);
		}
		insert pbeList;
		
		/*List<PricebookEntry> pbe1List=new List<PricebookEntry>();
		
		for(integer i=0;i<10;i++)
		{
		
		PricebookEntry pbe2=new PriceBookEntry();
			pbe2.UnitPrice=10;
			pbe2.isactive=true;
			pbe2.Product2Id=pList.get(i).Id;
			pbe2.PriceBook2Id=pList.get(i).Id;
			pbeList.add(pbe2);
				
		}
		insert pbe1List;*/
	}
    
}