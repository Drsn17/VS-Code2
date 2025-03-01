public with sharing class Pagination1
{
	private integer totalRecs = 0;
	private integer OffsetSize = 0;
	private integer LimitSize= 10;
	public Pagination1()
	{
		totalRecs = [select count() from account];
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
}