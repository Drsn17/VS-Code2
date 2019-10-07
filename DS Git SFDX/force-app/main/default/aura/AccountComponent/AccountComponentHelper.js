({
	helperMethod : function(component, event, helper) {
		var action =component.get("c.getAcc");
    action.setCallback(this, function(response)
    {
    var r=response.getReturnValue();
        component.set("v.account",r); 
        console.log(r); 
});  
   $A.enqueueAction(action); 
	}
})