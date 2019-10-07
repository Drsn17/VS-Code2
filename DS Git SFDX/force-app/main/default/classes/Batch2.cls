public class Batch2 implements Schedulable  
{
	/*public static void SchuduleDelete()
	{
		String cron='0 0 12 1/1 * ? *';
		//System.schedule('hello',cron,new Batch2());	
		
	} */
	
    public void execute(SchedulableContext sc) 
    {
    	
     	Batch1 b=new Batch1();
     	Database.executeBatch(b);
		
    }
}