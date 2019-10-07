({
	helperMethod : function(c, e, h) {
		
	},
	handleActive: function (c, e, h) {
                var tab = e.getSource();
                switch (tab.get('v.id')) {
                    case 'badge' :
                        this.injectComponent('lightning:input', tab);
                        break;
                    case 'buttons' :
                        this.injectComponent('lightning:button', tab);
                        break;
                    case 'icons':
                        this.injectComponent('lightning:button', tab);
                        break;
                    case 'inputs':
                        this.injectComponent('lightning:formattedDateTime', tab);
                        break;
                }
            },
            injectComponent: function (name, target) {
                $A.createComponent(name, {
                    // no attrs
                }, function (contentComponent, status, error) {
                    if (status === "SUCCESS") {
                        target.set('v.body', contentComponent);
                    } else {
                        throw new Error(error);
                    }
                });
            }

})