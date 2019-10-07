({
	helperMethod : function() {
		
	},
    addNewSection_helper : function(c, e, h){
        console.log('test12----'+c.get("v.formId"));
        var sectionObjectList = c.get("v.sectionObjList");
        console.log('test12----'+c.get("v.formId"));
        var newSectionObject = {};
        newSectionObject.Name = undefined;
        var sectionObj = c.get("v.formObj") ;
        var formName =  sectionObj.Name;
        if(!$A.util.isUndefinedOrNull(formName) && !$A.util.isEmpty(formName)){
            newSectionObject.Form_Name__c = sectionObj.Id;
            newSectionObject.LookupValue = formName;
        }else{
            newSectionObject.Form_Name__c = undefined;
            newSectionObject.LookupValue = undefined;
        }
        newSectionObject.Section_Color__c = undefined;
        newSectionObject.Priority__c = undefined;
        newSectionObject.Help_Text__c = undefined;
        sectionObjectList.push(newSectionObject);
        c.set("v.sectionObjList", sectionObjectList);
    },
})