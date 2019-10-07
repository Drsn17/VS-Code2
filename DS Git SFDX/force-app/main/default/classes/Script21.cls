public with sharing class Script21 {
	public static void clonetest()
	{
		Opportunity op1=new Opportunity();
		op1=[Select name, CloseDate,StageName,id from Opportunity where name='Darshan2ff'];
		
		//List <Opportunity> opNewList= new List<Opportunity>();
		
		Opportunity op2=new Opportunity();
        op2=op1.clone(false,false,true,false);
        op2.closeDate=op1.closedate.addDays(30);
        op2.name=op1.name+'Clone';
        insert op2;
        
        list<OpportunityLineItem> OLEList=new List<OpportunityLineItem>();
       	OLEList=[Select  Quantity, UnitPrice, PricebookEntryId From OpportunityLineItem Where OpportunityId =:op1.id ];
       
       List<OpportunityLineItem> newoleList=new List<OpportunityLineItem>();
       
       for(OpportunityLineItem oli1:OLEList)
       {
       	OpportunityLineItem oli2=new OpportunityLineItem();
            oli2=oli1.clone();
            oli2.OpportunityId=op2.Id;
            newoleList.add(oli2);
       }
       insert newoleList;
    
	}
}