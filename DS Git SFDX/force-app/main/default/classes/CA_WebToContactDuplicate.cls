/*********************************************************************************************************
* Class Name  	: CA_WebToContactDuplicate
* Test Class.   :
* @Author       : DARSHAN SINGH ALMIYA	
* @Date         : 07 Nov 2017
* @Description : This apex class is used to
* UPDATES
* Version          Developer                    Date                        Description
*-------------------------------------------------------------------------------------------
*     1.0                                      07 Nov 2017                   Initial Creation 
****************************************************************************************************************/

public class CA_WebToContactDuplicate {
    public static void duplicateLead(List<Lead> LeadList)
    {
        list<Lead> oldLead= new list<Lead>();
        list<Lead> UpdatedLead= new list<Lead>();
        list<Lead> DeletedLead= new list<Lead>();
        
        Set<id> Lead_Id=new Set<id>();
    	for(Lead l:LeadList)
        {
    	Lead_Id.add(l.Id); 
    	}
        
        oldLead=[select FirstName, LastName, Company,Email, Organization__c from Lead where id not in: Lead_Id];

        //Map<id,String> leadId=new Map<id,String>();
    	for(Lead l1:LeadList)
    	{
			for(Lead l2:oldLead)
			{
				if(l1.FirstName==l2.FirstName && l1.LastName ==l2.LastName && l1.Company ==l2.Company && l1.Email == l2.Email)
    		{
    			//leadId.put(l2.Id,l1.Organization__c);
                lead l3=new lead();
                l3.id=l1.id;
                DeletedLead.add(l3);
                
                 lead l4 = new lead();
                 l4.Organization__c=l2.Organization__c+';'+l1.Organization__c;
				 l4.id=l2.id;
				 UpdatedLead.add(l4);
    		 }
    		
    	}
    }
        if(DeletedLead.size()>0)
        {
            delete DeletedLead;
        }
        if(UpdatedLead.size()>0)
        {
            update UpdatedLead;
        }
      
        /*	for(ID i:LeadId.keySet())
        	{
        		Lead UpLead=new Lead();
        		UpLead.ID=i;
        		UpLead.Organization__c=LeadId.get(i);
        		UpdatedLead.add(UpLead);
        	}
        	update UpdatedLead;  
            delete DeletedLead;


        /*		
        for(Lead l1:oldLead)
        {
            for(Lead l2:newLead)
            {
                if(l2.FirstName==l1.FirstName && l2.LastName ==l1.LastName && l2.Company ==l1.Company)
                {
                    merge l2 newLead;  
                }
            }
        }
        */

    }

}