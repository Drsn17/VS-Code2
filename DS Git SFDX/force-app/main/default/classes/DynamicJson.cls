global class DynamicJson {
    
    
    @RemoteAction
    global static String convertToJson(){
        MainJson localJsonObject = new MainJson();
        list<JsonForDataClass> data = new list<JsonForDataClass>();
        list<JsonForLinkClass> links = new list<JsonForLinkClass>();
        
        for(project__c project : [Select ID, Name, Id__c, Duration__c,Parent__c,Type__c, Open__c, Order__c, Progress__c, Start_Date__c,(Select Id__c, Source__c, Target__c,Type__c from projectLinks__r) from Project__c ] ){
        
            data.add(new JsonForDataClass(Integer.valueOf(project.Id__c) , project.Progress__c , project.Name ,String.valueOf(project.Start_Date__c.format('dd-MM-yyyy')) , Integer.valueOf(project.Duration__c) , project.Open__c));
            
            for(projectLink__c projectLinksobj : project.projectLinks__r){
            
                links.add(new JsonForLinkClass(Integer.valueOf(projectLinksobj.Id__c) , Integer.valueOf(projectLinksobj.Source__c) , Integer.valueOf(projectLinksobj.Target__c) ,projectLinksobj.Type__c));
            }
        }
        
        localJsonObject.data = data;
        localJsonObject.links = links;
        return JSON.serialize(localJsonObject);
    }
    
    
    
    global class MainJson{
        public list<JsonForDataClass> data;
        public list<JsonForLinkClass> links;
       /* global override String toString(){
            String toString = '[data=' + data +'],links=['+links+']';
           
            return toString;
        }*/
    }
    global class JsonForDataClass{
        public integer id{get;set;}
        public String text{get;set;}
        public String start_date{get;set;}
        public integer duration{get;set;}
        public integer parent{get;set;}
        public boolean open{get;set;}
        public Decimal progress{get; set;}
        public integer order{get;set;}
        
        
        global JsonForDataClass(Integer id , Decimal progress, String text , String start_date , Integer duration,boolean n ){
        
            this.id = id; 
            this.progress = progress;
            this.text = text; 
            this.start_date = start_date; 
            this.duration = duration;
            this.open = n;
            this.parent = parent;
            this.order = order;
        }
        
        
        global JsonForDataClass(Integer id,Decimal progress , String text , String start_date , Integer duration , integer parent ){
        
            this.id = id; 
            this.progress = progress;
            this.text = text; 
            this.start_date = start_date; 
            this.duration = duration;
            this.parent = parent;
           // this.open = n;
        }
        
        /*global override String toString(){
            String toString = 'id=' + id +',text='+text+',duration='+duration+',start_date='+start_date+',parent='+parent;
            if(parent == null){
                toString = 'id=' + id +',text='+text+',duration='+duration+',start_date='+start_date;
            }
            return toString;
        }*/
    
    }
    global class JsonForLinkClass{
        public integer id{get;set;}
        public integer source{get;set;}
        public integer target{get;set;}
        public String type{get;set;}
        
        global JsonForLinkClass(Integer id , Integer source , Integer destination , String type){
            this.id = id; 
            this.source = source; 
            this.target = destination; 
            this.type = type;
        
        }
      /*  global override String toString(){
            String toString = 'id=' + id +',source='+source+',destination='+destination+',type='+type;
           
            return toString;
        }*/
    
    }
    
}