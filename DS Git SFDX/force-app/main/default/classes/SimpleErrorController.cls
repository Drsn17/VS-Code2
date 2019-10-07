/*
 * Created by CA on 14-Dec-18.
 */
public class SimpleErrorController {
	static final List<String> BAD_WORDS = new List<String> {
			'bad',
			'words',
			'here'
			};

	@AuraEnabled
	public static String helloOrThrowAnError(String name) {

		// Make sure we're not seeing something naughty
		for(String badWordStem : BAD_WORDS) {
			if(name.containsIgnoreCase(badWordStem)) {
				// How rude! Gracefully return an error...
				System.debug('1324');
				throw new AuraHandledException('NSFW name detected.');
				//System.AuraHandledException(e.getMessgae());
			}
			System.debug('1456324');
		}

		// No bad word found, so...
		return ('Hello ' + name + '!');
	}
}