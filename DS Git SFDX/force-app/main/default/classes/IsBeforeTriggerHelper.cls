/*
 * Created by Cloud Analogy on 3/27/2019.
 */
public class IsBeforeTriggerHelper {
		public static void method1(List<Account> accountList, List<Account> oldAccountList)
			{
				System.debug('Account List---'+accountList);
				System.debug('Account List old---'+oldAccountList);

				Map<Id, String> newListIDString = new Map<Id, String>();
				Map<Id, String> oldListIDString = new Map<Id, String>();

				for(Account acc : accountList)
					{
						if(! newListIDString.containsKey(acc.Id)){
							newListIDString.put(acc.Id, acc.TestField__c);
						}
					}

				for(Account acc : oldAccountList)
					{
						if(! oldListIDString.containsKey(acc.Id)){
							oldListIDString.put(acc.Id, acc.TestField__c);
						}
					}

				System.debug('newListIDString----'+newListIDString);
				System.debug('oldListIDString----'+oldListIDString);

	}

}