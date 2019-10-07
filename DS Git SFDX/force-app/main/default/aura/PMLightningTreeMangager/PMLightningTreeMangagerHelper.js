/*({
    getAcctContacts : function (c, e, h) {
        var action = c.get("c.getAccountHierarchy");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                //Change "Contacts" key to "_children"
                for(var i=0; i<data.length; i++) {
                console.log('data'+data.length);
                    if( data[i]['Contacts'] != null || data[i]['Contacts'] != undefined)
                    {
                    data[i]._children = data[i]['Contacts'];
                    delete data[i].Contacts;
                    }
                }

                c.set('v.gridData', data);

            }
            // error handling when state is "INCOMPLETE" or "ERROR"
         });
         $A.enqueueAction(action);
    }

})*/

({
   getAcctContacts : function(c, e, h) {
     var action = c.get("c.getAccountHierarchy");
     action.setCallback(this, function(response) {

       var state = response.getState();
       if (state === "SUCCESS") {
       var data = response.getReturnValue();
       var temojson = JSON.parse(JSON.stringify(data).split('items').join('_children'));
       console.log(temojson);
       c.set('v.gridData', JSON.parse(temojson));
         /*c.set( "v.items", response.getReturnValue());
         var temp = response.getReturnValue();
         console.log('----v');
         console.log(temp);
         console.log('temp-label--'+temp[0].items);*/

         /*console.log('temp temp-label--'+temp[0].label);
         console.log('esdrfghjk2');

         c.set('v.gridColumns', [
          {label: 'Account Name', fieldName: 'temp.items', type: 'text'}]);
         console.log('abc---123'+response.getReturnValue());*/
       }
     });
     $A.enqueueAction(action);
   }
 })