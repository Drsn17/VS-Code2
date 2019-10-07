/*
 * Created by Cloud Analogy on 3/28/2019.
 */
public class AirtableMainController {

	public static final String apiKey = 'key51OMLLp3FckFbU';
	public static final String BASE_URL = 'https://api.airtable.com/v0/';
	public static final String objectName = 'Opportunities';
	public static final String tableId = 'appv2SrojDN0TPqVX';

	Public static String returnJSONString;
	Public static String offSetString;
	Public static String finalJSONResponse;

	public static string getRecordFromAirTable()
		{
			try {
				Boolean isfinalJSONResponse = false;
				String newJSONString;
				String finalJSON;
				String str;

				String apiValue = BASE_URL + tableId + '/' + objectName;
				System.debug(LoggingLevel.ERROR, 'apiValue----' + apiValue);

				HttpRequest req = new HttpRequest();
				req.setMethod('GET');
				if (offSetString != null)
				{
					apiValue += '?offset=' + offSetString;
				}
				System.debug(LoggingLevel.ERROR, 'apiValue----' + apiValue);
				req.setEndpoint(apiValue);
				req.setHeader('Authorization', 'Bearer ' + apiKey);

				Http http = new Http();
				HTTPResponse res = http.send(req);
				System.debug('response body'+ res.getBody());
				str = res.getBody();
				System.debug(LoggingLevel.ERROR, 'str----' + str);

				if (offSetString == null && !str.contains('"offset":'))
				{
					return str;
				}

				if (str.contains('"offset":'))
				{
					offSetString = str.substringBetween('"offset":"', '"}');
					newJSONString = str.remove(offSetString);
					newJSONString = newJSONString.remove('],"offset":""}');
					newJSONString = newJSONString.remove('{"records":[');
				} else if (!str.contains('"offset":') && offSetString != null)
				{
					newJSONString = str.remove('{"records":[');
					newJSONString = newJSONString.removeEnd('],}');
					if (returnJSONString != null)
					{
						returnJSONString = returnJSONString + ',' + newJSONString;
					} else {
						returnJSONString = newJSONString;
					}

					offSetString = null;
					newJSONString = null;
				}

				if (offSetString != null && str.contains('"offset":')) {

					if (returnJSONString != null)
					{
						returnJSONString = returnJSONString + ',' + newJSONString;
					} else {
						returnJSONString = newJSONString;
					}
				}

				System.debug(LoggingLevel.ERROR, 'offSetString----' + offSetString);
				System.debug(LoggingLevel.ERROR, 'newJSONString----' + newJSONString);
				System.debug(LoggingLevel.ERROR, 'returnJSONString----' + returnJSONString);

				System.debug(LoggingLevel.ERROR, 'returnJSONString final----' + returnJSONString);
				if (returnJSONString != null) {
					finalJSON = '{"records":[' + returnJSONString + ']}';
					System.debug(LoggingLevel.ERROR, 'finalJSON----' + finalJSON);
				}
			if (str.contains('"offset":'))
			{
				System.debug(LoggingLevel.ERROR, 'offSetString method');
				AirtableMainController.getRecordFromAirTable();
			} else if (finalJSON != null) {
				finalJSONResponse = finalJSON;
				isfinalJSONResponse = true;
			}
			System.debug('finalJSONResponse----last' + finalJSONResponse);
			return finalJSONResponse;
		}
			catch(Exception ex)
			{
				System.debug(LoggingLevel.ERROR,'Exception is----'+ex.getMessage() +' at line number---'+ex.getLineNumber());

			}
			return null;
		}
}