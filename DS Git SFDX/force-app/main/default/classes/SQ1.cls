public with sharing class SQ1 {
	public static void total_hour()
	{
		List<Plan__c> pList= [select Travel_Hours__c from Plan__c where  Travel_Location__c includes ('A','F')];
		Decimal hr=0;
		for(Plan__c p:Plist)
		{
			hr=hr + p.Travel_Hours__c;
		} 
		System.debug('Total Hours = ' +hr );  
		
		
	}
    
}