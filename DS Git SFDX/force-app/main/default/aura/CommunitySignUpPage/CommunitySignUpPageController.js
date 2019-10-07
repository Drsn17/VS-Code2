({
    doInit : function(c, e, h){
        h.doInit_Helper(c, e, h);
        h.getUser_Helper(c, e, h);
        //h.setPickListValues(c, e, h);
    },

    signUp : function(c, e, h){
        h.signUp_Helper(c ,e, h);
    },

    lastNameBlur : function(c, e, h){
        h.lastNameBlur_Helper(c ,e, h);
    },

    userEmailIdBlur : function(c, e, h){
        h.userEmailIdBlur_Helper(c ,e, h);
    },

    userUserIdBlur : function(c, e, h){
        h.userUserIdBlur_Helper(c ,e, h);
    },
    checkIsSelect : function(c, e, h){
        h.checkIsSelect_helper(c, e, h);
    },
    communityNickNameBlur : function(c, e, h){
        h.communityNickName_helper(c, e, h);
    },

    onlyNumberCheck : function(c, e, h){
    console.log('onlyNumberCheck---');
    var inputCmp = c.find("inputCmp");
    var value = inputCmp.get("v.value");
    /*console.log('value->'+value);
    console.log('value->'+value.length);*/
    // Is input numeric?
    if(isNaN(value)){
            c.find("inputCmp").set('v.value',c.get('v.phn'));
        }
        else{
        c.set('v.phn',value);
        }

    },

    closeToast : function(c, e, h){
           c.set("v.isToast",false);
    }

})