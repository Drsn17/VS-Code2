public with sharing class controller_for_page
{	
    public List<accountWrapper> display_list {get; set;}
	private integer totalRecs = 0;
	private integer OffsetSize = 0;
	private integer LimitSize= 10;
     public List<String> current_list = new List<String>();
    
    
    public controller_for_page() {   
        Integer record_counter = 0; //counter
        totalRecs = [select count() from account];
        for (Account a :[SELECT Id FROM Account ORDER BY Name LIMIT 10000]) { //for a bunch of accounts
            if (record_counter < LimitSize) { //if we have not yet reached our maximum list size
                current_list.add(a.Id); //add the Id of the record to our current list
            } 
            record_counter++;
        }
    }
	
    public List<accountWrapper> getRecordsToDisplay() {
        Set<String> record_ids = new Set<String>(); //set for holding distinct Ids
        Boolean records_added = record_ids.addAll(current_list); //add all the records from our current_list list
        display_list = new List<accountWrapper>(); //set the display_list object to a new accountWrapper List
        Integer counter = 1; //row counter variable
        for (Account a : [SELECT AccountNumber, Id, Name, OwnerId, Phone, Site, Type FROM Account WHERE Id in : record_ids ORDER BY Name]) { //query for the details of the records you want to display
            display_list.add(new accountWrapper(a, counter)); //add the account and counter to our list
            counter++; //increment the counter
        }
        return display_list; //return the list of full records plus their row counter
    }
    
	public List<account> getacclist()
	{
		List<account> acc = Database.Query('SELECT Name, AccountNumber, Phone, description FROM account LIMIT :LimitSize OFFSET :OffsetSize');
		System.debug('Values are ' + acc);
		return acc;
	}
	public void FirstPage()
    {
        OffsetSize = 0;
	}
	public void previous()
	{
		OffsetSize = OffsetSize-LimitSize;
	}
    public void next()
	{
		OffsetSize = OffsetSize+LimitSize;
	}
    public void LastPage()
	{
		OffsetSize = totalrecs-math.mod(totalRecs,LimitSize);
	}
	public boolean getprev()
	{
		if(OffsetSize == 0)
			return true;
		else
			return false;
	}
	public boolean getnxt()
	{
		if((OffsetSize + LimitSize) > totalRecs)
			return true;
		else
			return false;
	}
    public Integer getCurrentSize() {
        return current_list.size(); //number of record in current_list
    }
    
    public class accountWrapper {
        public Account act {get; set;} //Account object
        public Integer numberOfRow {get; set;} //row counter variable
        
        public accountWrapper(Account a, Integer rowCounter) {
        this.act = a; //assign account
        this.numberOfRow = rowCounter; //assign row counter
        }
    }
}