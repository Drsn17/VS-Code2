({
	helperMethod : function(component, event, helper) {
	var action=componet.get("c.findAll"); 
        action.setCallback(this,function(a)
        {
            componet.set("v.Accounts",a.getReturnValue());
    });
        $A.enqueueAction(action);  
 
	} 
})