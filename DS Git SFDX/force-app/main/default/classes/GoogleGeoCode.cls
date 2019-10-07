global class GoogleGeoCode {
    
    public GoogleGeoCode(ApexPages.StandardController controller) {

    }
    
    public static integer debug = 1;
    
    private static final map<string,string> config = new map<string, string>();
   
    private static final string serviceUrl = 'http://maps.google.com/maps/geo?key=' + geoApiKey.key;
    
    @future (callout=true)
    public static void geocodeUser( list<string> accids ) { 
    
        // fetch the address from this User(s) 
        User[] al = [ select id, name, street,city,
            State,postalcode from User where id in :accids];
         
        // store the resulting lat-lon in the Users
        for ( User a: al) { 
            string adr = a.street + ',' + a.city + ',' + a.state; 
            if ( a.postalcode != null ) 
                adr += ',' + a.postalcode; 
            
            xmldom dom = geocode(adr); 
            processGeocodeDom ( dom , a);
        }
        update al;
    }
    
    /* given a DOM, look at the code and store the values or error found */
    public static void processGeocodeDom( xmldom dom, User a ) {
        if (dom != null) {
            if ( dom.root.getValue('code') == '200' )  {
                string[] lat_lon = dom.root.getValue('coordinates' ).split(',');
                
                a.GeaoLocation__latitude__s = Double.valueOf(lat_lon[1]); 
                system.debug('***debug1---'+Double.valueOf(lat_lon[1]));
                a.GeaoLocation__Longitude__s = Double.valueOf(lat_lon[0]);
                system.debug('***debug2---'+Double.valueOf(lat_lon[0]));  
                //a.geocode_status__c = 'G_GEO_SUCCESS';
            } else { 
                a.GeaoLocation__latitude__s = 0.0; 
                a.GeaoLocation__Longitude__s = 0.0;
                //a.geocode_status__c = geo_response.get( dom.root.getValue('code') ) + ' ('+ dom.root.getValue('code') + ')';
            }     
        }
    }
    
    public static void geocodeOneUser(string Userid) {
       User a = [ select id, name , 
            street,city,State,postalcode 
            from User where id = :Userid limit 1];      
        
        string adr = a.street + ',' + a.city + ',' + a.state; 
        if ( a.postalcode != null ) 
            adr += ',' + a.postalcode; 
            
        xmldom dom = geocode(adr); 
        processGeocodeDom ( dom , a);
        
        if ( dom != null ) {
            //update a;   
        }

    }
    static Map<String, String> geo_response = new Map<String, String>{'200'=>'G_GEO_SUCCESS',
    '400'=>'G_GEO_BAD_REQUEST',
    '500'=>'G_GEO_SERVER_ERROR',
    '601'=>'G_GEO_MISSING_ADDRESS',
    '602'=>'G_GEO_UNKNOWN_ADDRESS',
    '603'=>'G_GEO_UNAVAILABLE_ADDRESS',
    '604'=>'G_GEO_UNKNOWN_DIRECTIONS',
    '610'=>'G_GEO_BAD_KEY',
    '620'=>'G_GEO_TOO_MANY_QUERIES'
    };
    
    public static xmldom geocode( string addr ) { 
        HttpRequest req = new HttpRequest();   
        string url = GoogleGeoCode.serviceUrl + '&output=xml&q=' + EncodingUtil.urlEncode(addr,'UTF-8');
        system.debug ( 'url is ' +url );
        req.setEndpoint( url );
        req.setMethod('GET');
        
        xmldom dom = null;
        try {
            Http http = new Http();
            HttpResponse response = http.send(req);
            
            if (response.getStatusCode() != 200 ) {
                dumpResponse ( response);
            } else {
                dom = new xmldom( response.getBody() );
            } 
        } catch( System.Exception e) {
            System.debug('ERROR: '+ e);
        }  
        
        if ( googleGeoCode.debug > 0 && dom != null ) { 
            dom.dumpAll(); 
        } 
        return dom;
    }
    
    private static void dumpResponse(HttpResponse response) { 
        system.debug('GEOCODE ERROR: Could not parse or locate address'); 
        System.debug('STATUS:'+response.getStatus());
        System.debug('STATUS_CODE:'+response.getStatusCode());
        System.debug('BODY: '+response.getBody());
        xmldom dom = new xmldom( response.getBody() );
        dom.dumpAll();
    }
    
     webService static void go( string accid ) {
        geocodeOneUser( accid );
    }
}