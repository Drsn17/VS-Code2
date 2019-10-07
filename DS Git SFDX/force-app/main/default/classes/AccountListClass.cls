public with sharing class AccountListClass {
	@auraEnabled
	public static list<account> getAllAccounts()
		{
			list<account> accs = [select id,name,phone,industry,(select lastName from contacts) from account limit 10];
			//  list<account> accs =[select id,name,phone,industry from account limit 10];
			//   return [select Id,Name from account limit 10];
			return accs;
		}

	  /*@AuraEnabled public static List<Account> getAccountContacts(){
	  List<Account> accountcontacts =
	 //[SELECT Id, Name, Phone, (SELECT Id, Contact.Name, Phone FROM contacts) FROM Account];
	  [SELECT Id, Name, Phone, ParentId, Parent.Name, Parent.Phone FROM Account where ParentId = null];
				  set<id> accountId =new set<id>();
	   for(Account acc: accountcontacts1)
		  			  {
		  			  if(accountcontacts1.size() > 0)
		  				  {
		  					  accountId.add(acc.Id);
		  				  }
		  		  }
		  	  List<Account> accountcontacts = [SELECT Id, Name, Phone, ParentId, Parent.Name, Parent.Phone FROM Account where ParentId = :accountcontacts1];
	 return accountcontacts;
	  }*/

	@AuraEnabled
	public static List<items> getAccountContacts() {
		List<items> accountcontacts = new List<items>();

		for (Account acc: [SELECT Id, Name, Phone, ParentId, Parent.Name, Parent.Phone, Parent.ParentId, Parent.Parent.Name, Parent.Parent.Phone FROM Account where id ='0017F00000C384xQAB'])
			{
				List<items> trP1 = new List<items>{new items(acc.Phone, acc.Name, false, null)};
				List<items> trP2 = new List<items>{new items(acc.Parent.Phone, acc.Parent.Name, false, trP1)};
				accountcontacts.add(new items(acc.Parent.Parent.Phone, acc.Parent.Parent.Name, false, trP2));
			}

		return accountcontacts;
	}

	public class items {

		@AuraEnabled
		public string label {
			get; set;
		}

		@AuraEnabled
		public string name {
			get; set;
		}

		@AuraEnabled
		public Boolean expanded {
			get; set;
		}

		@AuraEnabled
		public List<items> items {
			get; set;
		}

		public items( String name, String label, Boolean expanded, List<items> items) {
			system.debug('sdfg');
			system.debug('items-----'+items);
			this.label = label;
			this.name = name;
			this.expanded = expanded;
			this.items = items;
		}
	}
}