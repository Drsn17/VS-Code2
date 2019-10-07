public with sharing class paginationjquery 
{
   public List<WrapperTest> wrTest{get;set;}
    public paginationjquery(){
        wrTest = new List<paginationjquery.WrapperTest>();
        List<Account> accList = [SELECT Name, AccountNumber, Phone FROM Account limit 500];

        if(accList.SIZE()>0) {
            Integer count=0;
            for (Account ac : accList) {
                if(count==10){
                    count=0;
                    System.debug(' '+count);
                }
                WrapperTest wt = new WrapperTest();
                wt.name = ac.Name;
                wt.AccountNumber = ac.Name;
                wt.Phone = ac.Phone;
                wt.counter=++count;

                System.debug(wt.counter+' '+count);
                wrTest.add(wt);
            }


        }
    }

    public class WrapperTest {
        public Integer counter{get;set;}
        public String name{get;set;}
        public String AccountNumber{get;set;}
        public String Phone{get;set;}
        
    }

}