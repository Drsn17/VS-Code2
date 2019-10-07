/*
 * Created by Cloud Analogy on 4/9/2019.
 */
public class CommunityUserInsertByApex {
	public static Boolean createCommunityUser(){
		try{
			Boolean result = false;
			/*Account partnerAccount= new Account(Name = 'Account for Community');
			insert partnerAccount;

			partnerAccount.IsPartner = true;
			update partnerAccount;

			Contact theContact = new Contact();
			theContact.FirstName = 'Test';
			theContact.Lastname = 'Contact1';
			theContact.AccountId = partnerAccount.Id;
			theContact.Email = 'test32@test.com';

			insert theContact;
			System.debug('theContact---'+theContact);
*/
			//Create user
			Profile portalProfile = [select Id from Profile where Name = 'Partner Community User' limit 1];

			System.debug('t5test---');

			User theUser = new User();
			theUser.Username = 'darshan.singh@cloudanalogy.com';
			theUser.ContactId = '0037F00001ONQmWQAX';
			theUser.ProfileId = portalProfile.Id;
			theUser.Alias = 'test123';
			theUser.Email = 'darshan.singh@cloudanalogy.com';
			theUser.EmailEncodingKey = 'UTF-8';
			theUser.LastName = 'DS';
			theUser.CommunityNickname = 'ds';
			theUser.TimeZoneSidKey = 'America/Los_Angeles';
			theUser.LocaleSidKey = 'en_US';
			theUser.LanguageLocaleKey = 'en_US';

			Savepoint sp = Database.setSavepoint();

			try {
				insert theUser;
			}
			catch(DmlException ex) {
				if(ex.getDmlStatusCode(0) == StatusCode.DUPLICATE_USERNAME.name()) {
					result = true;
				}
			}
			finally {
				Database.rollback(sp);
			}
			System.debug('result---'+result);
			System.debug('sp---'+sp);

			return result;


		}
		catch(Exception ex){
			System.debug('Exception is---'+ex.getMessage() + ' at line numbber'+ ex.getLineNumber());
		}
		return null;
	}
}