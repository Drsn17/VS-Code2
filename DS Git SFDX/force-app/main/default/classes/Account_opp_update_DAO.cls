public class Account_opp_update_DAO {
    public static void add(List<Opportunity> oppList){
        account act=[SELECT All_Opportunity_Revenue__c,Total_opportunity__c FROM Account where id =: oppList[0].accountId LIMIT 1];
        act.Total_opportunity__c= act.Total_opportunity__c+1;
        act.All_Opportunity_Revenue__c=act.All_Opportunity_Revenue__c;
        insert act;
    }
}