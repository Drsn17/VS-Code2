public with sharing class Script4 {
	public static void add()
	{
		List<Product2> PList= new List<Product2>();
		for(integer i=0;i<20;i++)
		{
			Product2 prd=new Product2();
			prd.Name= 'Darshan'+i;
			prd.isactive=true;
			prd.Description= 'Total product'+i;
			prd.Family='total member'+i;
			PList.add(prd);
		}
		
		if(pList.size()>0)
		{
		insert PList;
		}
	}
}