global with sharing class OpportunityForEmailServices implements Messaging.InboundEmailHandler 
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope) 
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        String EmailBody=email.plainTextBody;
         
       /* String oppname=EmailBody.substringBetween('Name:','CloseDate'); 
        String oppCloseDate=EmailBody.substringBetween('CloseDate:','StageName');
        String oppStage=EmailBody.substringBetween('StageName:','Thanks');  */
        
        String temp1=EmailBody.substringAfter('Name:');  
        String oppname=temp1.substringBefore('CloseDate');
        
        String temp2=EmailBody.substringAfter('CloseDate:');  
        String oppCloseDate=temp2.substringBefore('StageName:');
        
        String temp3=EmailBody.substringAfter('StageName:');  
        String oppStage=temp3.substringBefore('Thanks'); 
         
        
        oppCloseDate = oppCloseDate.trim();
        Date d = Date.parse(oppCloseDate);

      		Opportunity opp = new Opportunity();
      		opp.name = oppName;
            opp.CloseDate=d;  
            opp.StageName=oppStage;
            insert opp;

    
        result.success = true;
        return result;
    }

}