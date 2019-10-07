({
   doInit: function (cmp, event, helper) {
   console.log('esdrfghjk1');
     helper.apexMethod(cmp);
     console.log('esdrfghjk2');
   },
   handleSelect: function (cmp, event, helper) {
   console.log('esdrfghjk3');
     //return name of selected tree item
     var myName = event.getParam('name');
     console.log('myName'+myName);
     alert("You selected: " + myName);
   }
 })