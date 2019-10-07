/*
 * Created by CA on 27-Jul-18.
 */
public class ContactAura {
	@AuraEnabled
	public static List<Contact> get10COntacts()
		{
			return [SELECT Id, NAME FROM Contact Limit 10] ;
		}
}