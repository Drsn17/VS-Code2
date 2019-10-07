public class Batch3 implements Schedulable {
	public static void ScheduleDelete() 
	{
		list<CronTrigger> c=new list<CronTrigger>();
		c=[Select Id from CronTrigger]; 
		for(CronTrigger ct:c)
        {
       // System.debug('ID');
		System.debug(ct.id);
		System.abortJob(ct.id); 
        }
	}
	public void execute(SchedulableContext Sc)
	{
		Batch2 b2=new Batch2();
	}
    
}