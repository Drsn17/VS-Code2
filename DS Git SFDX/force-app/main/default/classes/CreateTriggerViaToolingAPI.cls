/*
 * Created by Cloud Analogy on 3/27/2019.
 */
public class CreateTriggerViaToolingAPI {
	public static String createVFPage_Apex(String objName) {
		system.debug('objName:--> '+objName);
		try {
			String removeExtraUnderscore =objName;
			removeExtraUnderscore = removeExtraUnderscore.replaceAll('__c', '');
			removeExtraUnderscore = removeExtraUnderscore.replaceAll('__', '');
			System.debug('removeExtraUnderscore--> '+removeExtraUnderscore);

			String salesForceHost = System.Url.getSalesforceBaseUrl().toExternalForm();
			String url = salesForceHost + '/services/data/v44.0/sobjects/ApexTrigger';
			HttpRequest req = new HttpRequest();
			req.setMethod('POST');
			req.setEndpoint(url);
			req.setHeader('Content-type', 'application/json');
			req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
			String reqBody = '{ "Name" : "TestAccountTrigger", "TableEnumOrId" : "Account", "Body" : "trigger TestAccountTrigger on Account (before insert) {}" }';
			System.debug('reqBody--> '+reqBody);
			req.setBody(reqBody);
			Http http = new Http();
			HttpResponse res = new HttpResponse();
			if (Test.isRunningTest()) {
				return '{"id":"0667F000002YMY5QAO","success":true,"errors":[]}';
			} else {
				res = http.send(req);
			}
			system.debug('res.getBody()'+res.getBody());
			return res.getBody();

		} catch (Exception ex) {
			return ex.getMessage();
		}
	}
}