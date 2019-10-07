public with sharing class SQ9 {
	public static void userCon()
	{
		List<User> userList=[select email from User];
		System.debug('---------'+userList);
		
		set<String> user_email=new set<String>();
		for(User us:userList)
		{
			user_email.add(us.email);
		}
		
		list<contact> conList = [select Name from contact where email in:user_email];
		system.debug(conList);
		
	}
    
}