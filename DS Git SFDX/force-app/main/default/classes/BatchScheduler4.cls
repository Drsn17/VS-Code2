global class BatchScheduler4 implements Schedulable{
	public static void Sd4()
	{
		String cron='0 0 12 1/1 * ? *';
		System.schedule('hello',cron,new BatchScheduler4());	
		
	} 
	
	global void execute(SchedulableContext sc) 
	{
	Batch4 b4 = new Batch4(); 
	database.executebatch(b4);
	}
}