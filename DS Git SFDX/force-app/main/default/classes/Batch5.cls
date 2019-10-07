global class Batch5 implements Schedulable {
	/*/global static void sc5()
	{
		String cron1='0 0 0/6 1/1 * ? *';
		System.schedule('hello1',cron1,new Batch5());
	}*/
	global void execute(SchedulableContext SC)
	{
		Batch4 b4=new Batch4();
	}
    
}