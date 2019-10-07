public class SampleController {

    public PageReference ok() {
        return null;
    
    }
    
    public List<Account> list1 { get; set; }

   
    public SampleController ()
{
   list1 = [select id,name from Account];
}

}