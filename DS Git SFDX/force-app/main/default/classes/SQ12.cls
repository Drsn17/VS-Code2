public with sharing class SQ12 {
    public static void getAccount()
    {
        list<Case> caseList=[select AccountId from Case where AccountId != null and status ='Working'];
        System.debug('Account id');
    }

}