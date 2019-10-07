public with sharing class Script16 {
	public static void diffDate()
	{
	DateTime startDate= DateTime.newInstance(2016,1,2,6,7,55);
	DateTime endDate= DateTime.newInstance(2016,2,5,7,8,55);
	
	Integer difYears = endDate.year()-startdate.year();
	
	Integer difMonths = endDate.month()-startdate.month();
	
	Integer difDays = endDate.day()-startdate.day();
			
	Integer difHours = endDate.hour()-startdate.hour();
		
	Integer difMinutes = endDate.minute()-startdate.minute();
		
	Integer difSec = endDate.second()-startdate.second();
		
	system.debug(difYears +',' + difMonths + ',' + difDays + ',' + difHours + ',' + difMinutes + ',' + difSec);
	
		
		
	}
}