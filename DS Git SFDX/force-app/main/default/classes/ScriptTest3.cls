public with sharing class ScriptTest3 {
	
	public static void caseAccount()
	{
		List<case> cList=new list<case>();
		cList=[select AccountId,Account.Name from case where Account.NumberOfEmployees > 100];
		for(Case c:cList)
		{
			System.debug('Account name----'+ c.Account.Name);
		}
	
	}
    
}