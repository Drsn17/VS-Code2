global class Batch11 implements Schedulable{
	global void execute(SchedulableContext sc)
	{
		list<lead> leadlist=[select id from lead where Createddate=YESTERDAY and phone!=null];
		sendmail(leadlist);
	}
	global void sendmail(list<lead> lList)
	{
		Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
		email.setToAddresses(new String[] { 'darshan.singh@cloudanalogy.com' });
		email.setSubject('All lead is created Last Date'); 
		email.setPlainTextBody('All lead were created Yesterday, without Phone NUmber');
		Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
	}
    
}

/*
string cron='0 25 6 1/1 * ? *'
Batch11 b11=new Batch11();
system.schedule('Lead 12 Question',cron,b11);
*/