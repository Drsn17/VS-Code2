public class BusinessSummary {
   public List<ObjDetail> ObjDetailList {get;set;}
    
    public BusinessSummary()
    { 
        ObjDetailList = new List<ObjDetail>();
        Map<String, ObjDetail> IdVsObjDetailMap = new Map<String, ObjDetail>();
        List<Account> accList = new List<Account>();
        accList=[select name,Id from Account limit 10];
        if(accList.size() > 0){
            Set<Id> AccIds = new Set<Id>();
            for(Account acc : accList){
                ObjDetail Obj = new ObjDetail ();
                Obj.accId = acc.Id;
                Obj.Name = acc.Name;
                Obj.contactCount = 0;
                Obj.oppCount = 0;
                Obj.oliCount = 0;
                AccIds.add(acc.Id);
                IdVsObjDetailMap.put(acc.Id, Obj);
            }
            if(AccIds.size() > 0){
                List<Contact> conList = new List<Contact>();
                conList = [Select Id, AccountId From Contact Where AccountId In : AccIds AND AccountId != NULL];
                if(conList.size() > 0){
                    for(Contact co : conList){
                        if(IdVsObjDetailMap.containsKey(co.AccountId)){
                            ObjDetail Obj = IdVsObjDetailMap.get(co.AccountId);
							Obj.contactCount =   Obj.contactCount + 1;                        
                        }
                    }
                }
                List<Opportunity> oppList= new List<Opportunity>();
                oppList=[Select Id, AccountId from Opportunity where AccountId In :AccIds AND AccountId != NULL];
                if(conList.size() >0){
                    for(Opportunity opp:OppList){
                        if(IdVsObjDetailMap.containsKey(opp.AccountId)){
                            objDetail Obj = IdVsObjDetailMap.get(opp.AccountId);
                            Obj.oppCount = Obj.OppCount + 1;
                        }
                    }
                }
				
            }
        }
        if(IdVsObjDetailMap.size() > 0){
            ObjDetailList = IdVsObjDetailMap.values();
        }
        system.debug('ObjDetailList --> '+ObjDetailList);
    }
    
    public class ObjDetail {
        public String AccId {get;set;}
        public String Name{get;set;}
        public integer contactCount{get;set;}
        public integer oppCount{get;set;}
        public integer oliCount{get;set;}
    }
}