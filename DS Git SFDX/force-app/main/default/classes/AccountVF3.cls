public class AccountVF3 {
	public String searchstring { get; set; }
	public list<Account> accountList{get;set;}
	public AccountVF3()
    { 
		accountList = new list<Account>();
		accountList = [SELECT id,name,Phone,Billingcity,BillingPostalcode FROM Account LIMIT 100];
    }
	public PageReference search() 
    {
		accountList.clear();
		accountList = [SELECT id,name,Phone,Billingcity,BillingPostalcode FROM Account WHERE Name =:searchstring /* OR Phone =:searchstring OR Billingcity =:searchstring OR BillingPostalcode =:searchstring */];
        return null;
	}
	public PageReference clear() {
	accountlist.clear();
	accountList = [SELECT id,name,Phone,Billingcity,BillingPostalcode FROM Account LIMIT 100];
	return null;
	}
}