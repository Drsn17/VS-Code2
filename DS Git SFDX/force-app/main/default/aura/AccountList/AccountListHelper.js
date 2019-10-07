({
	helperMethod : function(component, event, helper) {
	
	var action =component.get("c.getAllAccounts");
	
	
    action.setCallback(this, function(response)
    {
    var r=response.getReturnValue();
        component.set("v.accounts",r); 
        console.log(r);   
});  
   $A.enqueueAction(action);  
    }
	}
})