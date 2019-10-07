({
  "echo" : function(cmp) {

          var action = cmp.get("c.serverEcho");
          action.setParams({ firstName : cmp.get("v.firstName") });

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