({
	getAirtableData_Helper : function(c, e, h) {
		try{
            console.log('getAirtableData_Helper');

            var action = c.get("c.insertRecord_Apex");
            action.setCallback(this, function (response) {
                var state = response.getState();
                console.log('state---'+state);
                if (state === "SUCCESS") {
                   console.log('response.getReturnValue()----'+response.getReturnValue());
                }
                else if (state === "ERROR"){
                    console.log("Unknown error");
                }
            });
            $A.enqueueAction(action);

        }
        catch(ex){
            console.log('Error----'+ex);
        }
	},
})