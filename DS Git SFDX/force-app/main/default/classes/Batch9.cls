global class Batch9 implements Schedulable {
	global static void scheduleEveryfiveMin()
	{
		for(integer i=0;i<=55;i+=5)
		{
			string cron='0 '+i+' * * * ?';
			String jobName='JOb'+i;
			System.debug(cron);
			System.Schedule(jobName, cron, new Batch9());
		}
	}
	global void execute(SchedulableContext sc)
	{
		Batch7 b7=new Batch7();
		Database.executeBatch(b7);  
    }
}