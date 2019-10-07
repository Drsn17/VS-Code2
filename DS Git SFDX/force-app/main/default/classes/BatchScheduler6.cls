global class BatchScheduler6 implements Schedulable {
	global void oppDelete()  
	{
		CronTrigger ct=new CronTrigger();
		ct=[Select Id from CronTrigger limit 1];
		System.debug('ID');
		System.debug(ct.id);
		System.abortJob(ct.id);
	}
	global void execute(SchedulableContext Sc)
	{
		Batch5 b5=new Batch5();
	}
}