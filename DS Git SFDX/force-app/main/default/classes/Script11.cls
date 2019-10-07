public with sharing class Script11 {
	 public static void reverce()
	 {
	 	
    	List<Account> accList=new List<Account>();
    	accList=[select name from Account limit 5];
    
    String []str=  new string[]{' ',' ',' ',' ',' ',' '};
    String []rev=  new string[]{' ',' ',' ',' ',' ',' '};
    		for(integer i=0;i<5;i++)
    		{
    	  		str[i]=String.valueOf(accList[i].name);
    	  		rev[i]=str[i].reverse();
    	  		System.debug(rev[i]);
    	  	}
    	  	
    }
    
}