public with sharing class AccountAdd 
{
	public static void addField()
	{
		List<Account> AcList = new List<Account>();
		for(Integer i=0;i<20;i++)
		{
			Account a=new Account();
			a.Name='Darshan'+i;
			a.AccountNumber='31526945'+i;
			a.Fax='Noida Sec'+i;
			a.Phone='895852825'+i;
            a.NumberOfEmployees=2;
			AcList.add(a);
		} 
		insert AcList;  
	}
}