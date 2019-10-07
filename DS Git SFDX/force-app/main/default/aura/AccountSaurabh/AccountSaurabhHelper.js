({
    save_helper:function(c,e,h){
        var action = c.get("c.AccountSaurabhController");
        var acc = c.get("v.AccObj");
        action.setParams({
            "newlist": JSON.stringify(acc),
        });
       action.setCallback(this, function (r) {
                console.log('-----> 63'); 
                if (r.getState() === 'SUCCESS') { 
                    var responseString = r.getReturnValue();
                    console.log('responseString----> ' + JSON.stringify(responseString));
                    if (responseString !== null) {
                        var storedResponse = r.getReturnValue();
                        console.log('storedResponse--->>'+JSON.stringify(storedResponse));
                        var newObjList = [];
                        for (var i = 0; i < storedResponse.length; i++) {
                            var obj = storedResponse[i];
                            var newObj = {};
                            for (var key in obj) {
                                if (obj.hasOwnProperty(key)) {
                                    var keyList = key.split('__');
                                    var newKey = '';
                                    if (keyList.length > 2) {
                                        newKey = keyList[1].concat('__' + keyList[2]);
                                    } else {
                                        newKey = key;
                                    }
                                    newObj[newKey] = obj[key];
                                    
                                }
                            }
                            newObjList.push(newObj); 
                        } 
                        if (newObjList.length > 0) {
                            
                            c.set("v.ListOfAccount", newObjList);
                         }
                     }
                  } 
            });
            $A.enqueueAction(action);
           c.set("v.AccObj.Name","");
           c.set("v.AccObj.AccountNumber","");
           c.set("v.AccObj.Phone","");
           c.set("v.AccObj.NumberOfEmployees","");
            
        }
    
})