public with sharing class Location_ctrl {
    public User userDetails{get;set;}
    public Location_ctrl(){
        userDetails = [SELECT City, Street, Country, State, Postalcode, Around_Me_Street_Address__c FROM User WHERE id = : UserInfo.getUserId() LIMIT 1];
    }
    public PageReference onSave() {
        try{
        system.debug('userDetails>>>>>'+userDetails);
            update userDetails;
        } catch(Exception ex) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,ex.getMessage()));
        }
        PageReference pr = new PageReference('/apex/Location?core.apexpages.devmode.url=1');
        pr.setRedirect(true);
        
        return pr;
    }
}