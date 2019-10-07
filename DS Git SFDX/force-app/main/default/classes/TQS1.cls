public with sharing class TQS1 {
        public static void planTest(list <Plan__c> plist)
    {
        List<Plan__c> pnewList= [select Travel_Hours__c from Plan__c where Travel_Location__c includes ('A')];
        System.debug('Travel List---------'+pnewList);
        Decimal totalHr=0;
        for(Plan__c pl : pnewList)
        {
         
            totalHr= totalHr + pl.Travel_Hours__c; 
        }
        for(Plan__c pc:pList)
        {
            if(totalHr + pc.Travel_Hours__c >100)
            pc.addError('You can not more Travels in same ----> A');
 }
}
}