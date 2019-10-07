/*
 * Created by CA on 06-Aug-18.
 */
public class LightningTreeApexController {
	@AuraEnabled
	public static List<items> getAccountHierarchy(Id accountId) {
system.debug('accountId----'+accountId);
		//Wrapper instance
		List<items> finalWrp = new List<items>();

		//Going upto 2 level only as per SOQL limit
		for(Account acc : [ Select Id, Name, Type, Phone, ParentId, Parent.Name, Parent.Type, Parent.Phone, Parent.ParentId, Parent.Parent.Name, Parent.Parent.Type, Parent.Parent.Phone From Account]) {
			system.debug('Account1234565----'+acc.ParentId);

			//populating wrapper
			List<items> trP1 = new List<items>{new items(acc.Type, acc.Name, false, null)};
			List<items> trP2 = new List<items>{new items(acc.Parent.Type, acc.Parent.Name, false, trP1)};
			system.debug('trp1---'+trP1);
			system.debug('trp2---'+trP2);
			finalWrp.add(new items(acc.Parent.Parent.Type, acc.Parent.Parent.Name, false, trP2));
			//finalWrp.add(new items(acc.Parent.Type,acc.Parent.Name, false , trP1));
		}

		System.debug('finalWrp:::' + finalWrp);
		// return wrapper
		return finalWrp;
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
			system.debug('sdfghn');
			this.label = label;
			this.name = name;
			this.expanded = expanded;
			this.items = items;
		}
	}

}