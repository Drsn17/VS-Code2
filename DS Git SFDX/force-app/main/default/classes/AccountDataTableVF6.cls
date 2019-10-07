public with sharing class AccountDataTableVF6 {
	public list<Account> AccountList {get;set;}
	public AccountDataTableVF6()
	{
		AccountList=new list<Account>();
		AccountList=[select name from Account limit 20];
	}
    
}