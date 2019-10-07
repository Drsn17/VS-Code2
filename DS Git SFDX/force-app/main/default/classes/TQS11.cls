public with sharing class TQS11 {
    public static void contactInserted(list <contact> conList)
    {
        for(Contact c:conList)
        {
            if(c.SAME_COUNTRY_AS_USER_COMPANY__c==true)
            {
            c.addError('You can not Inserted value becouse SAME_COUNTRY_AS_USER_COMPANY is Active ');
            }
        }
    }
}