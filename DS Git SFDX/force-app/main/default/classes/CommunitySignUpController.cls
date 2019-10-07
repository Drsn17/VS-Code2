/*
 * Created by Cloud Analogy on 4/13/2019.
 */
public class CommunitySignUpController {
	@AuraEnabled
	public static Boolean signUp_Apex(String communityData){
		try {
			Boolean result = false;
			System.debug('signUp_Apex called');
			if (communityData != null) {
				System.debug('communityData----' + communityData);
				CommunityUser_Wrapper communityWrapper =
						(CommunityUser_Wrapper)JSON.deserialize(communityData, CommunityUser_Wrapper.class);
				System.debug('communityWrapper----' + communityWrapper);
				if (communityWrapper != null) {

					Profile portalProfile = [select Id from Profile where Name = 'Partner Community User' limit 1];

					User theUser = new User();

					theUser.Username = communityWrapper.UserName;
					theUser.ContactId = '0037F00001ONQmWQAX';
					theUser.ProfileId = portalProfile.Id;
					theUser.Alias = communityWrapper.Alias;
					theUser.Email = communityWrapper.EmailId;
					theUser.EmailEncodingKey = 'UTF-8';
					theUser.LastName = communityWrapper.LastName;
					theUser.CommunityNickname = communityWrapper.CommunityNickname;
					theUser.TimeZoneSidKey = 'America/Los_Angeles';
					theUser.LocaleSidKey = 'en_US';
					theUser.LanguageLocaleKey = 'en_US';
					theUser.IsActive = false;

					Savepoint sp = Database.setSavepoint();

					try {
						insert theUser;
						System.debug('theUser----'+theUser);
					} catch (DmlException ex) {
						if (ex.getDmlStatusCode(0) == StatusCode.DUPLICATE_USERNAME.name()) {
							result = true;
						}
					} /*finally {
						Database.rollback(sp);
					}*/
					System.debug('result---' + result);
					System.debug('sp---' + sp);

					return result;
				}
			}
		}
		catch (Exception ex){
			System.debug('Exception is ----'+ex.getMessage() +' at line number---'+ex.getLineNumber());
		}
		return null;
	}


	@AuraEnabled
	public static List<String> getPicklistFieldValues(String objectName, String pickListFieldName){
		try{
			if(objectName != null && pickListFieldName != null){
				System.debug('getPicklistFieldValues---');
				System.debug('objectName---'+objectName);
				System.debug('pickListFieldName---'+pickListFieldName);
				List<String> picklistValues = new List<String>();
				SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
				List<Schema.PicklistEntry> pick_list_values = objectType.getDescribe()
						.fields.getMap()
						.get(pickListFieldName)
						.getDescribe().getPickListValues();
				for (Schema.PicklistEntry aPickListValue : pick_list_values) {
					picklistValues.add(aPickListValue.getValue());
				}
				System.debug('picklistValues----'+picklistValues);
				if(!picklistValues.isEmpty()){
					return picklistValues;
				}

			}
		}
		catch (Exception ex){
			System.debug('Exception is ----'+ex.getMessage() +' at line number---'+ex.getLineNumber());
		}
		return null;

	}


	@AuraEnabled
	public static List<User> getUserRecords_Apex(){
		try{
			System.debug('getUserRecords_Apex----');

			List<User> userList = [SELECT Id, Name, Username, CommunityNickname from User limit 10000];

			System.debug('userList---'+userList);
			return userList;

		}
		catch (Exception ex){
			System.debug('Exception is---'+ex.getMessage() + ' at line number---'+ex.getLineNumber());

		}
		return null;

	}

	public class CommunityUser_Wrapper {
		@AuraEnabled public String AccountName;
		@AuraEnabled public String FirstName;
		@AuraEnabled public String LastName;
		@AuraEnabled public String EmailId;
		@AuraEnabled public String UserName;
		@AuraEnabled public String EmailEncodingKey;
		@AuraEnabled public String CommunityNickname;
		@AuraEnabled public String TimeZoneSidKey;
		@AuraEnabled public String LocaleSidKey;
		@AuraEnabled public String LanguageLocaleKey;
		@AuraEnabled public String Alias;
		@AuraEnabled public String SubscriptionType;
		@AuraEnabled public String NumberOfUser;
		@AuraEnabled public String Phone;
		@AuraEnabled public String City;
		@AuraEnabled public String State;
	}
}