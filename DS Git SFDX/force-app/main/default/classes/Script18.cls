public with sharing class Script18 {
	public static void newadmin()
	{
		Profile pid=[select id from Profile where name='System Administrator' limit 1];
		User usr=new User();
		usr.LastName='Test Script18';
		usr.Alias='Test18';
		usr.email='darshan.singh@cloudanalogy.com';
		usr.UserName='script18Test@cloudanalogy.com';
		usr.CommunityNickname='ScriptTest';
		usr.profileid=pid.id;
		usr.TimeZoneSidKey='GMT';
		usr.LanguageLocaleKey='en_US'; 
		usr.LocaleSidKey='en_US';
		usr.EmailEncodingKey='UTF-8';	
		insert usr;
	}

}