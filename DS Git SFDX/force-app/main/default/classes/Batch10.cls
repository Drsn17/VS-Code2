global class Batch10 implements Schedulable{
	global static void deleteSc()
	{
		List<CronTrigger> cronList=[Select id from CronTrigger where CronJobDetail.Name like'Job%'];
		for(CronTrigger cn : cronList)
		{
			system.abortJob(cn.id);
		}
	} 
	global void execute(schedulableContext sc)
	{
		Batch9 b9=new Batch9();
	}
}