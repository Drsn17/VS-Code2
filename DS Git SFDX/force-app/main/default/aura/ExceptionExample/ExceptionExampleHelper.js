({
	saveNewValue_Helper : function(c, e, h) {

	    var action = c.get("c.helloOrThrowAnError");
        action.setParams({ name : c.get("v.NameVaue") });
		action.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        alert("From server: " + response.getReturnValue());
                    }
                    else if (state === "INCOMPLETE") {
                        // do something
                    }
                    else if (state === "ERROR") {
                        var errors = response.getError();
                        if (errors) {
                            if (errors[0] && errors[0].message) {
                                console.log("Error message: " +
                                         errors[0].message);
                            }
                        } else {
                            console.log("Unknown error");
                        }
                    }
                });
                $A.enqueueAction(action);
            }

})