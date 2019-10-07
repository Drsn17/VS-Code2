({
   apexMethod : function(cmp) {
     var action = cmp.get("c.getAccountHierarchy");
     action.setParams({ accountId : cmp.get("v.recordId") });
     action.setCallback(this, function(response) {

       var state = response.getState();

       if (state === "SUCCESS") {
         var abc = cmp.set( "v.items", response.getReturnValue());
         console.log('abc---'+abc);
       }
     });
     $A.enqueueAction(action);
   }
 })