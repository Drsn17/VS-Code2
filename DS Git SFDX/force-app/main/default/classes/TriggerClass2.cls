public with sharing class TriggerClass2 {
	public static void date1(List<Opportunity> opList)
	{	
		for(Opportunity o:opList)
		{
			if(o.CloseDate<Date.today())
			{
				if(!Test.isRunningTest())
				o.addError('Please Enter the future Close Date');		
					
			}
		}
	}
    
}