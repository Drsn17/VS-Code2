({
    openTab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '#/sObject/0037F00000AV9zlQAD/view',
            focus: true
        });
    },
})