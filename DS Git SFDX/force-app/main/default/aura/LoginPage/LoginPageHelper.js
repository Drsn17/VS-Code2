({
    loginAction_helper : function(component, event, helper) {

        var Uname=component.get("v.item")
        console.log('Uname------'+Uname);
        var Pswd=component.get("v.pwd")
        console.log('Pswd------'+Pswd);

        var action = component.get("c.getLogin");

        action.setParams({
            "User_name":Uname,
            "pass":Pswd
        });

        action.setCallback(this, function(response) {
            if (response.getState() === 'SUCCESS') {
                var storedResponse = response.getReturnValue();
                console.log('storedResponse:');
                console.log(storedResponse);

                if(storedResponse!=null)
                {
                    component.set("v.isOpen", true);
                    component.set("v.isClose",false)
                }


            } else {
                console.log('ERROR');
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
    }
})