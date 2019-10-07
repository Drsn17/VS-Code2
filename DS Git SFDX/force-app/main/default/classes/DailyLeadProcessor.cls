global class DailyLeadProcessor implements Schedulable{
    
    global void execute(SchedulableContext sc)
    {
    	List<Lead> leads = [Select Id, LeadSource from Lead where LeadSource = null limit 200];
     	for(lead ld : leads)
        {
            ld.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}