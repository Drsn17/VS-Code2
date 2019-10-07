public with sharing class OpportunityDateVF7 {
	public Id opId{get;set;}
	public Boolean b{get;set;}
	public OpportunityDateVF7(ApexPages.StandardController controller)
	{
		//opId=controller.getId();
		Opportunity oppList=[select id,closeDate from Opportunity where id=:ApexPages.currentPage().getParameters().get('id')];
		if(oppList.CloseDate>=Date.today() && oppList.CloseDate<=Date.today().addDays(4))
		b=true;
		else
		b=false; 
	} 
       
}