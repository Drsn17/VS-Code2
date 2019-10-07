/*
 * Created by Cloud Analogy on 3/29/2019.
 */
public with sharing class AirtableMapping {

	public static void insertRecord_Apex(){
		try{
			System.debug('insertRecord_Apex');
			String responseData = AirtableMainController.getRecordFromAirTable();
			System.debug('responseData----'+responseData);

		}
		catch (Exception ex){
			System.debug('Exception is---'+ex.getMessage() + ' at line number---'+ex.getMessage());
		}

	}

}