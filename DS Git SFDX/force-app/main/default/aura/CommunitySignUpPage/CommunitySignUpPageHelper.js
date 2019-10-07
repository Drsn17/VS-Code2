({
	doInit_Helper : function(c, e, h) {
		try{
            var communityData = {
                AccountName : '',
                FirstName : '',
                LastName : '',
                EmailId : '',
                UserName : '',
                EmailEncodingKey :'',
                CommunityNickName : '',
                TimeZoneSidKey : '',
                LocaleSidKey : '',
                LanguageLocaleKey : '',
                SubscriptionType : '',
                NumberOfUser : '',
                Phone : '',
                State : '',
                City : ''

            };
            var isOnBlurCheck = {
                isLastName : false,
                isEmail : false
            };

            var isDuplicate = {
                isUserId : false,
                isNickName : false
            };


            console.log('communityData----',communityData);
            console.log('communityData----'+JSON.stringify(c.get('v.communityData')));
            c.set("v.communityData",communityData);
            c.set("v.isOnBlurCheck",isOnBlurCheck);
            c.set("v.isDuplicate",isDuplicate);
            console.log('isDuplicate----'+c.get("v.isDuplicate"));

		}
		catch(e){
		console.log('Error----'+e);
		}
	},

	setPickListValues : function(c, e, h){
	    try{
	        var pickListValues = {};
	        pickListValues.subscribeType = [];
	        pickListValues.noOfSubscriber = [];
	        c.set("v.pickListValues",pickListValues);

	        /*var subscribeType = h.getPickListValues(c, e, h, 'paws__Temporary_User__c','paws__Subscription_type__c');
	        var noOfSubscriber = h.getPickListValues(c, e, h, 'paws__Temporary_User__c','paws__Number_Of_User__c');*/

	        h.getPickListValues(c, e, h, 'paws__Temporary_User__c','paws__Subscription_type__c').then(function(data){
                var returnSubscribeType = data;
                console.log('subscribeType promise---'+returnSubscribeType);
                console.log(typeof returnSubscribeType);
                returnSubscribeType.forEach(function(e){
                    var label = e;
                    pickListValues.subscribeType.push(label);
                });
            });

            h.getPickListValues(c, e, h, 'paws__Temporary_User__c','paws__Number_Of_User__c').then(function(data){
                var returnNoOfSubscriber = data;
                console.log('noOfSubscriber promise---'+returnNoOfSubscriber);
                returnNoOfSubscriber.forEach(function(e){
                    var label = e;
                    pickListValues.noOfSubscriber.push(label);
                });
                console.log('pickListValues>>'+JSON.stringify(pickListValues));
                c.set("v.pickListValues",pickListValues);
                console.log('pickListValues----'+JSON.stringify(c.get("v.pickListValues")));
            });

	        /*console.log('subscribeType----'+subscribeType);
	        console.log('noOfSubscriber---'+noOfSubscriber);
	        console.log('subscribeType----'+JSON.stringify(subscribeType));
            console.log('noOfSubscriber---'+JSON.stringify(noOfSubscriber));*/
	    }
	    catch(e){
	        console.log('Error----'+e);
	    }
	},

	getPickListValues : function(c, e, h, objectName, fieldName){
	    try{
	            return new Promise($A.getCallback(function(resolve){
                    console.log('getPickListValues method');
                    console.log('objectName---'+objectName);
                    console.log('fieldName---'+fieldName);
                    var action = c.get("c.getPicklistFieldValues");
                    action.setParams({
                            objectName : objectName,
                            pickListFieldName : fieldName
                            });
                    action.setCallback(this, function(response) {
                        var state = response.getState();
                        console.log('state---'+state);
                        if (state === "SUCCESS") {

                            console.log("Return Value: " + JSON.stringify(response.getReturnValue()));
                            var responseValue = response.getReturnValue();
                            if(! $A.util.isUndefinedOrNull(responseValue) && ! $A.util.isEmpty(responseValue)){
                                console.log('responseValue picklist---'+responseValue);
                                resolve(responseValue);
                            }
                            else{
                                console.log('responseValue Else part---');
                            }

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
                }));


	    }
	    catch(e){
	        console.log('Error----'+e);
	    }

	},

	getUser_Helper : function(c, e, h){
	    try{
	        var action = c.get("c.getUserRecords_Apex");

            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {

                    console.log("Return Value: " + JSON.stringify(response.getReturnValue()));
                    var responseValue = response.getReturnValue();
                    if(! $A.util.isUndefinedOrNull(responseValue) && ! $A.util.isEmpty(responseValue)){
                        c.set("v.userList",responseValue);
                        console.log('userList'+c.get("v.userList"));
                    }
                    else{
                        console.log('responseValue Else part---');
                    }

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
	    catch(e){
	        console.log('Error---'+e);
	    }

	},


	signUp_Helper : function(c, e, h){
	    try{
	        if(h.validationForFields(c, e, h)){
	            var isDuplicate = c.get("v.isDuplicate");
               if(! isDuplicate.isUserId && ! isDuplicate.isNickName)
               {
                    var communityData = c.get("v.communityData");
                    console.log('communityData in sign up ----'+JSON.stringify(communityData));

                    var action = c.get("c.signUp_Apex");
                            action.setParams({
                            communityData : JSON.stringify(communityData)
                            });

                            action.setCallback(this, function(response) {
                                var state = response.getState();
                                if (state === "SUCCESS") {

                                    console.log("From server: " + response.getReturnValue());
                                    if(response.getReturnValue() == true){
                                       // alert('User Id Already Used');
                                        var isDuplicate = c.get("v.isDuplicate");
                                        isDuplicate.isUserId = true;
                                        //h.showToast(c, e, h);
                                        c.set("v.isToast", true);
                                    }

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
               else{
                console.log('User Id or Community Nick name can not be duplicate');
               }
	        }
	    }
	    catch(e){
	        console.log('Error Sign UP --'+e);
	    }
	},

	validationForFields : function(c, e, h){
	    try{
	        var allValid = c.find('field').reduce(function (validSoFar, inputCmp) {
              inputCmp.showHelpMessageIfInvalid();
              return validSoFar && inputCmp.get('v.validity').valid;
           }, true);
           if (allValid) {
               return true;
           } else {
               return false;
           }
	    }
	    catch(ex){
	        console.log('Exception>>'+ex);
	    }
	},

	 lastNameBlur_Helper : function(c, e, h){
            try{
                console.log('lastNameBlur_Helper');
                var communityData = c.get("v.communityData");
                var isOnBlurCheck = c.get("v.isOnBlurCheck");

                console.log('communityData in sign up ----'+JSON.stringify(communityData));
                console.log('isOnBlurCheck ----'+JSON.stringify(isOnBlurCheck));

                if(!isOnBlurCheck.isLastName){
                    var alias;
                    if(communityData.FirstName != null && communityData.LastName!= null){
                         alias = communityData.FirstName.charAt(0) + communityData.LastName.substring(0,3);
                    }
                    else if(communityData.LastName!= null)
                    {
                         alias = communityData.LastName.substring(0,4);
                    }
                    console.log('alias----'+alias);

                    communityData.Alias = alias;
                    isOnBlurCheck.isLastName = true;

                    c.set('v.communityData',communityData);
                    c.set('v.isOnBlurCheck',isOnBlurCheck);
                }
                else{
                    console.log('lastNameBlur_Helper is in else condition');
                }

            }
            catch(e)
            {
                console.log('Error --'+e);
            }
        },

        userEmailIdBlur_Helper : function(c, e, h){
            try{

                  console.log('userEmailIdBlur_Helper');
                  var communityData = c.get("v.communityData");
                  var isOnBlurCheck = c.get("v.isOnBlurCheck");
                  console.log('communityData userEmailIdBlur_Helper ----'+JSON.stringify(communityData));
                  console.log('isOnBlurCheck ----'+JSON.stringify(isOnBlurCheck));

                  if(! isOnBlurCheck.isEmail){
                     communityData.UserName = communityData.EmailId;
                     isOnBlurCheck.isEmail = true;

                     var nickName = communityData.EmailId.split("@");
                     console.log('nickName>>'+nickName);
                     communityData.CommunityNickName = nickName[0];
                     console.log('communityData.CommunityNickName>>'+communityData.CommunityNickName);
                     c.set('v.communityData',communityData);
                     c.set('v.isOnBlurCheck',isOnBlurCheck);
                     h.communityNickName_helper(c, e, h);
                     console.log('get Community----'+c.get('v.communityData'));
                  }
                  else{
                     console.log('userEmailIdBlur_Helper is in false condition');
                  }
               }
               catch(e)
               {
                   console.log('Error --'+e);
               }
        },

        userUserIdBlur_Helper : function(c, e, h){
            try{
                if(h.checkUsernameValidation(c, e, h)){
                    console.log('userUserIdBlur_Helper');
                    var communityData = c.get("v.communityData");
                    console.log('userUserIdBlur_Helper ----'+JSON.stringify(communityData));
                }
            }
            catch(e)
            {
                   console.log('Error --'+e);
            }
        },
        checkUsernameValidation : function(c, e, h){
            try{
                var isDuplicate = c.get("v.isDuplicate");
                if(isDuplicate.isUserId){
                    isDuplicate.isUserId = false;
                }
                var userList = c.get("v.userList");
                var communityData = c.get("v.communityData");
                console.log('userList---'+userList);
                console.log('communityData---'+communityData.UserName);


                 for(var i=0; i<= userList.length - 1; i++ ){
                    console.log('communityData----'+communityData.UserName);
                    if(communityData.UserName === userList[i].Username)
                    {
                        console.log('Line break');
                        isDuplicate.isUserId = true;
                        break;
                    }

                }
                console.log('isDuplicate----'+isDuplicate);
                c.set('v.isDuplicate',isDuplicate);

            }
            catch(ex){
                console.log('Exception>>'+ex);
            }
        },
        checkIsSelect_helper : function(c, e, h){
            try{
                var isChecked = e.getSource().get('v.checked');
                console.log('isChecked>>'+isChecked);
                if(isChecked === true){
                    c.set("v.isDiasableButtton",false);
                }
                else{
                    c.set("v.isDiasableButtton",true);
                }
            }
            catch(ex){
                console.log('Exception>>'+ex);
            }
        },

        communityNickName_helper : function(c, e, h){
            try{
                var isDuplicate = c.get("v.isDuplicate");
                console.log('isDuplicate----',JSON.stringify(isDuplicate));
                if(isDuplicate.isNickName){
                    isDuplicate.isNickName = false;
                }
                var userList = c.get("v.userList");
                var communityData = c.get("v.communityData");
                console.log('userList---'+userList);
                console.log('communityData---'+communityData.CommunityNickName);

                for(var i=0; i<= userList.length - 1; i++ ){
                    if(communityData.CommunityNickName == userList[i].CommunityNickname)
                    {
                        console.log('Line break');
                        isDuplicate.isNickName = true;
                        break;
                    }

                }
                console.log('isDuplicate----'+isDuplicate);
                c.set('v.isDuplicate',isDuplicate);

            }
            catch(e){
                console.log('Error---'+e);
            }
        },

        showToast : function(c, e, h) {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Success!",
                "message": "The record has been updated successfully."
            });
            toastEvent.fire();
        }
})