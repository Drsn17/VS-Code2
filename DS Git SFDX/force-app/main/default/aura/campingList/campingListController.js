({
	clickCreateCamping : function(component, event, helper) {
               
        if(helper.createItem(component)){            
            var newItem = component.get("v.newItem");
            helper.createCamping(component, newItem);
        }                          
              
	},
    doInit: function(component, event, helper) {
    
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
    
        // Send action off to be executed
        $A.enqueueAction(action);
    },      
})