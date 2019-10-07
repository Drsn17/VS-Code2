/*
 * Created by CA on 06-Aug-18.
 */
public class LoginPage_ApexClass {
	@auraEnabled
	public static List<Login_Page__c> getLogin(String User_name, String pass)
		{

			system.debug('helper*******'+User_name);
			system.debug('helper&&&&&&'+pass);

			list<Login_Page__c> loginList = new list<Login_Page__c>();

			loginList=[select User_Name__c,Password__c from Login_Page__c where User_Name__c=:User_name and Password__c=:pass];
			system.debug('List======'+loginList);
			if(loginList.size()>0){
				return loginList;
			}else{
				return null;
			}

		}
}