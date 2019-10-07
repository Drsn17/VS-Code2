public with sharing class Script9 {
	public static void display()
	{
		List<User> usrList=new List<User>();
		UsrList=[select name,phone,email from user];
		for(User usr:usrList)
		{
			System.debug(usr.name);
			System.debug(usr.email);
			System.debug(usr.phone);
		}
	}
    
}