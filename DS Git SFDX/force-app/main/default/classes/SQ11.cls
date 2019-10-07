public with sharing class SQ11 {
	public static void userAddress()
	{
	
	User  userList=[select Country from User where id=:userinfo.getuserid()];
		System.debug('---------'+userList);
		
		list<contact> conList = [select lastName,mailingcountry from contact where mailingCountry =: userList.Country];
		system.debug(conList);
		
	}
}