public with sharing class OpportunityVF10 {
    public boolean b1{get;set;}
    public Opportunity opp{get;set;}
    
    public OpportunityVF10(ApexPages.StandardController controller)
    {
        b1=false;
        opp=(Opportunity) controller.getRecord();
    }
    public void onClick(){
        if(opp.stageName == 'Closed Won') 
            b1=true; 
        else
            b1=false;
    }
}