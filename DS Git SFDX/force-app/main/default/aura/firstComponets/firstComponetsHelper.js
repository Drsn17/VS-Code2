({
	helperMethod : function(c,e,h) {
		var action =c.get("c.getAcc");
    action.setCallback(this, function(response)
    {
    var r=response.getReturnValue();
        c.set("v.account",r); 
        console.log(r); 
});  
   $A.enqueueAction(action);  
    }
})