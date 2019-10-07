public with sharing class OppWithOLI {
	public opportunity oppstring{get; set;}
    public OpportunityLineItem olistring{get; set;}
    
    public OppWithOLI()
    {
        oppstring= new opportunity();
        olistring= new OpportunityLineItem();
        
    }
    public void Saveto()
    {
        opportunity opp= new opportunity();
        OpportunityLineItem oli=new OpportunityLineItem();
        opp.Accountid= oppstring.Accountid;
        opp.name= oppstring.name;
		opp.closedate= oppstring.closedate;
		opp.StageName= oppstring.StageName;
		opp.leadSource= oppstring.LeadSource;
		opp.Ownerid= oppstring.Ownerid;
		opp.Amount= oppstring.Amount;
		opp.IsPrivate= oppstring.IsPrivate;
		opp.NextStep= oppstring.NextStep;
		opp.Type= oppstring.Type;
		opp.Probability= oppstring.Probability;
		opp.Campaignid= oppstring.Campaignid;
		
        oli.Quantity=olistring.Quantity;
        oli.UnitPrice=olistring.unitPrice;
        oli.PricebookEntryId=olistring.PricebookEntryId;
        insert oli;
		insert opp;

}

}