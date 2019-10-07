public class OpportunityListVF2 {
    list<Opportunity> opp;
    
    public list<Opportunity> getOpp()
    {
        if(Opp == null)
        opp=[select Id,Name from Opportunity limit 100];
        return opp;
    }
 
}