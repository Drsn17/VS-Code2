public with sharing class GeoLocation {
    static List<Account> accListToUpdate = new List<Account>();
    public static string key = 'AIzaSyBZQf4yYvESwO1MsWU-BKwccoi84dNpZTU';//Server-Key
    
    @future(callout=true)
    public static void updateLangLongAccount(Set<Id> setOfNewAccountIds){
            
        for(Account accObj:[Select Id,BillingCity,BillingStreet,BillingState,BillingLatitude,BillingLongitude,BillingPostalCode,BillingCountry from Account Where Id IN:setOfNewAccountIds]){
            
            String address='';
            if(accObj.BillingStreet!=null){
                address += accObj.BillingStreet+'+';
                accObj.BillingStreet = accObj.BillingStreet.replace('\r\n', ' ');
                accObj.BillingStreet = accObj.BillingStreet.replace('\n', ' ');
                accObj.BillingStreet = accObj.BillingStreet.replace('\r', ' ');
            }
            if(accObj.BillingCity!=null){
                address += accObj.BillingCity+'+';
            }
            if(accObj.BillingState!=null){
                address += accObj.BillingState+'+';
            }
            if(accObj.BillingPostalCode!=null){
                address += accObj.BillingPostalCode+'+';
            }
            if(accObj.BillingCountry!=null){
                address += accObj.BillingCountry+'+';
            }
            if(address!=null && address.endsWith('+')){
                address = address.substring(0,address.lastIndexOf('+'));
                    
                String latLongCombo = GeoLocation.getLatitudeLongitude(address);

                if(latLongCombo!=null && latLongCombo!='' && latLongCombo.contains(',')){
                    String[] splittedValue = latLongCombo.split(',');
                    if(!splittedValue.isEmpty() && splittedValue[0]!=null && splittedValue[1]!=null){
                       accObj.BillingLatitude = Double.valueOf(splittedValue[0]);
                       accObj.BillingLongitude = Double.valueOf(splittedValue[1]);
                    }
                           
                }
                accListToUpdate.add(accObj);
            }   
        }
        
        if(!accListToUpdate.isEmpty()){
            try{
                RunOnce.run = false;
                System.debug('--->>>accListToUpdate='+accListToUpdate);
                update accListToUpdate;
            }catch(Exception ex){
                system.debug(' ****** Update account failed '+ex.getMessage());
            }
        }
    }
    
    
    public static String getLatitudeLongitude(String address){
        String location='';
        try{
            Double latitude = null;
            Double longitude = null;
            
            Http httpGetRequest = new Http();
            HttpRequest httpReq = new HttpRequest();
           
            system.debug('******Address---'+address);
            address = address.replace('\r\n', ' ');
            address = address.replace('\n', ' ');
            address = address.replace('\r', ' ');
            address=address.replaceAll(' ','+');
            system.debug('******After       Address---'+address);
            
            httpReq.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?key='+key+'&address=' +address + '&sensor=false');
            httpReq.setMethod('GET');
            httpReq.setTimeout(6000);
            
            HttpResponse httpResponseAddress = httpGetRequest.send(httpReq);
            system.debug('res body: ' + httpResponseAddress.getBody());
            
            JSONParser parser = JSON.createParser(httpResponseAddress.getBody());
                       
            while (parser.nextToken() != null)
            {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'location'))
                    {
                       // Jump to latitude and longtitude fields.
                        parser.nextToken();
                        while (parser.nextToken() != JSONToken.END_OBJECT)
                        {
                            String text = parser.getText();
                            parser.nextToken();
                            if (text == 'lat') latitude = parser.getDoubleValue();
                            else if (text == 'lng') longitude = parser.getDoubleValue();
                        }
                    } 
            }

            // Update Account coordinates.
            if (latitude != null)
            {
                location+= latitude + ', ' +  longitude;               
            }
        }catch(Exception e){
                system.debug('***** Exception Occured '+e.getMessage());
        }
        return location;
    }
}