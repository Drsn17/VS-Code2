public class Bs1 {
   public List<ObjDetail> ObjDetailList {get;set;}
    
    public Bs1()
    { 
        ObjDetailList = new List<ObjDetail>();
        Map<String, ObjDetail> IdVsObjDetailMap = new Map<String, ObjDetail>();
        List<Account> accList = new List<Account>();
        
        accList=[select name,Id from Account limit 10];
        Set<Id> AccIds = new Set<Id>();
        if(accList.size() > 0){
            for(Account acc : accList){
                ObjDetail Obj = new ObjDetail ();
                Obj.accId = acc.Id;
                Obj.Name = acc.Name;
                AccIds.add(acc.Id);
                IdVsObjDetailMap.put(acc.Id, Obj);
            }
        }
        if(IdVsObjDetailMap.size() > 0){
            ObjDetailList = IdVsObjDetailMap.values();
        }    
    }
    
    public class ObjDetail {
        public String AccId {get;set;}
        public String Name{get;set;}
        
    }
}