 


app.controller('RoomCtrl', function ($scope, Room, $rootScope, GoogleTranslate, $log, $http, $window, $timeout, Status) {
        
        var text_changed = 0;
        var audio_alerts = {};
        scroolldown();
        

        //$scope.sound.play();

        $scope.stopChat = function(opponent_id){
            /* add opponent to closed_room_users list
               to prevent sound alert in reapeted messages
            */
            $scope.closed_room_users.push(opponent_id);
            log($scope.closed_room_users);
            ///////////////////////////////////////////

           delete $rootScope.active_contacts['user_'+opponent_id]; 
           log($rootScope.active_contacts);           
        
            Room.closeRoom(opponent_id,function(result){
                var url = "http://" + local_config.chat_url  + "#/" + $rootScope.currentUserId;  
                $scope.hasActiveRoom = false;
                $window.location.href = url;       
                $scope.room_just_closed = true;        
            })
            
        }

        /*"""
        .. function:: $scope.translate()

            Function use GoogleTranslator service and translate mrssage from russuan to english in the textarea.
    
            Replace content of editable div $(document).find('#chat_message').html(resulf);
           
        */

        $scope.translate = function(){
            var message = $(document).find('#chat_message').html();
            $log.debug(message);
            GoogleTranslate.translate('ru','en',message).then(function(resulf){
              $(document).find('#chat_message').html(resulf).focus();
                
            });
            
            
        };

        /*"""
        .. function:: $scope.sendMessage()

            Function sends message from user to opponent.
    
            It takes content of div by id $(document).find('#chat_message').html() 
           
            Check if the message is not emply string.

            And makes request via Room service Room.sendMessage()

            Then clears textarea $(document).find('#chat_message').html("")
        */

        $scope.sendMessage = function(){
            
             
            var message = $(document).find('#chat_message').html();

            $scope.tm = Date.now();

            chm = message.replace('<br>','');
            if(chm.length>0) {

           // immidiatly show message in sender's list
           var myDate = new Date().toString().split(" ")[4];
	   mes = {'created': myDate, 'id': $scope.tm, 'owner': {'image': $rootScope.my_image}, 'message': message};
	   console.log(mes); 
           $(document).find('#chat_message').html("");
	   $scope.messages.push(mes);
           scroolldown();
           Room.sendMessage($scope.room_id, message, $rootScope.currentUserId, $scope.room_participants, $rootScope.gender, function(result) {
             
    


              if(result.status==1) {
                    $rootScope.emptyAccountAlert(); // when user has not money
                } else { 
                    //$(document).find('#chat_message').html("");
                    text_changed = 0;
                    // mark opponent as waiting to responce
                    for (var i = 0; i < result.participants.length; i++) {
                        $rootScope.waiting_to_responce['user_'+result.participants[i]] = true;
                        /// delete audio_alerts to hear new messages
                        delete audio_alerts[result.participants[i]];
                    }              
                    //**************************************
                    } 
              
            });

            }
        };






        /*"""
        .. function:: $scope.$on('show_message'

            Function updates message list if message gose to the current active room.

            Else it set $scope.new_messages.user_<user_id> var to show indicator.
    
            If transtation option $scope.chat_translate is enabled it translate the message.
            
        */

        $scope.$on('show_message', function (event, data) { 

              var def = Date.now()-$scope.tm
              
               /*

              if(def>1500 && data.message.owner.user_id==$rootScope.currentUserId){
                    
                    Status.restartServer(function(rezult){
                        alert('Sorry, but we have got some problem with the chat server and you page wil be reloaded in 15 sec. Please copy yor message if you have something wrote.');
                    });
              }
                */
                //console.log(data);

              // unmark room as closed
                for (var i = 0; i < data.message.participants.length; i++) {
                    var user_id = parseInt(data.message.participants[i].split('_')[1]);
                    if(user_id!=data.message.owner.user_id){
                        
                        var index = $scope.closed_room_users.indexOf(user_id);
                        
                        if (index > -1) {
                             $scope.closed_room_users.splice(index, 1);
                        }               
                    }
                }
               
               
              ////////////////////////

              // mark user as is not waiting to responce 
              delete $rootScope.waiting_to_responce['user_'+data.message.owner.user_id]
              //****************************************
              
             // sound in current chat for man and woman
             if($rootScope.gender=='m'){
                 if(
                    data.message.owner.user_id!=$rootScope.currentUserId  
                    && $scope.closed_room_users.indexOf(data.message.owner.user_id) == -1 
                    && $rootScope.active_contacts['user_'+data.message.owner.user_id]
                    && audio_alerts[data.message.owner.user_id] != 'true'
                    ){
                    //mySound.play();
                    document.getElementById('audio_alert').play();
                    audio_alerts[data.message.owner.user_id] = 'true';
                    
                 }
              } else {

                 if(data.message.owner.user_id!=$rootScope.currentUserId)  {
                    //mySound.play();
                    document.getElementById('audio_alert').play();
                 }                

              }

	            // update activity
			
			for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
		                if($rootScope.contact_user_list[i].user_id==data.message.owner.user_id) {
		                 
				    $rootScope.contact_user_list[i].activity = Date.now();
		                }
                   	}  
                    // blinking title     
                    if(data.message.owner.user_id!=$rootScope.currentUserId){               
                        $scope.blink_title_interval = setInterval(blinkTitle, 700);
                    } else {
                        clearInterval($scope.blink_title_interval);
                    }

               //TODO message.message
              if(data.message.room_id != $scope.room_id){
                    

                    

                    //log(data.message.message.room_id +'!='+ $scope.room_id);
                   // set envelop blinking (new message)
                   for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                        if($rootScope.contact_user_list[i].user_id==data.message.owner.user_id) {
                            $rootScope.contact_user_list[i].has_new_message = true;
			    $rootScope.contact_user_list[i].activity = Date.now();
                        }
                   }                  
                   //// show pop up in man case 

                   if($rootScope.gender=='m' && !$rootScope.active_contacts['user_'+data.message.owner.user_id]) {
                       // $rootScope.$broadcast('show_invite_notification',{'id': data.message.message.owner.user_id, 'data':{ 'message': data.message.message.message, 'opponent': data.message.message.owner}});
                    } 

                     // sound in unactive chat for women
                    // if(data.message.message.owner.user_id!=$rootScope.currentUserId  && $scope.closed_room_users.indexOf(data.message.message.owner.user_id) == -1 && $rootScope.gender == 'w' )  {
                      //  document.getElementById('audio_alert').play();
                     //}

              } else {

                      // remove overmessages
                    
                      //if($scope.messages.length>10){
                        
                     //    $scope.messages.shift();   
                     // }

                     $rootScope.feather = false;
                  
			

                      if($scope.chat_translate==true){
                            
                             
                             GoogleTranslate.translate('en','ru',data.message.message).then(function(result){
				
                             data.message.translated_message = result;
                             $scope.messages.push(data.message);
			
                             GoogleTranslate.save_translate(data,result); 
                            });


                       } else {

                        $scope.messages.push(data.message);
			console.log(data.message);
			

                       }
              }

               scroolldown();      
                

            
        });

        
        

        

        $rootScope.$on('put_me_in_room', function (event, data) {
       
           var isOldTitle;
           $rootScope.feather = false;
           $scope.room_just_closed = false;
           $scope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $rootScope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $scope.room_id = data.room_id;
           $rootScope.room_id = data.room_id;
           $scope.hasActiveRoom=true;
           

            // remove title blinking
            clearInterval($scope.blink_title_interval);
            document.title = oldTitle;
           // remove blinking envelop 
	        
           for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                if($rootScope.contact_user_list[i].user_id==data.contact_id) {
                    $rootScope.contact_user_list[i].has_new_message = false;
                    $rootScope.contact_user_list[i].activity = data.contact_data.activity;
                }
           }
           
           if(data.contact.is_camera_active) $rootScope.isOpponentVideoActive = true;
           Room.getUserInfo(data.contact_id,function(result){ 
            $scope.opponent = result.user_profile;
            $rootScope.current_opponent_id = data.contact_id;
            $rootScope.current_opponent = result.user_profile;
            if(result.user_profile.is_camera_active==true) {
                $rootScope.isOpponentVideoActive = true;
            } else {
                $rootScope.isOpponentVideoActive = false;
            }
         });
           
           Room.getMessages(data.room_id, function(result) {
              
              $scope.messages = result.message;
      
              setTimeout(function(){scroolldown(),1000});

              $(document).find('#chat_message').bind("DOMSubtreeModified",function(){
                  
                  if (text_changed==0){
               
                       Room.showFeather(data.contact.user_id, function(result) {

                        
                       });
                  }
                  text_changed = 1;
                });

         });

        });

        $rootScope.$on('show_feather',function(event,data){
            if(data.room_id==$rootScope.room_id){
             $rootScope.feather = true;
            }
        })

        $rootScope.$on('update_balance',function(event,data){
            $rootScope.balance = data.balance;
            if(data.status==1){
                $rootScope.emptyAccountAlert();
            }
        })


        $rootScope.$on('close_room',function(event,data){
           //log(data);
	       if(data.room_id==$scope.room_id){
		       $scope.room_just_closed = true;
               /* add opponent to closed_room_users list
                to prevent sound alert in reapeted messages
               */
               $scope.closed_room_users.push(parseInt(data.user_id));
		       var url = "http://" + local_config.chat_url  + "#/" + $rootScope.currentUserId;  
		       $scope.hasActiveRoom = false;
		       //$window.location.href = url; 
	      }     
        })

         $scope.$on('i_started_watching_you', function (event, data) {
           
           if($rootScope.gender=='w') {

  
                // mark user as watching in contact list
                $rootScope.men_watching['user_'+data.user_id] = true;
                //**************************************

                // close window after some time
                $timeout(function(){
                    delete $rootScope.system_messages[data.user_id+'_show'];
                }, 15000);

                Room.getUserInfo(data.user_id,function(result){ 
                    $rootScope.system_messages[data.user_id+'_show'] = {
                                                                             'message': result.user_profile.name+' started watching you.',
                                                                             'user': result.user_profile
                                                                            }
                    
                 });
                
            } else {
                // mark user as watching in contact list
                $rootScope.women_watching['user_'+data.user_id] = true;
                
                //**************************************
            }
        });
        
         $scope.$on('i_stopted_watching_you', function (event, data) {
           if($rootScope.gender=='w') {              

                // mark user as not watching in contact list
                delete $rootScope.men_watching['user_'+data.user_id];
                //**************************************

                // close window after some time
                $timeout(function(){
                    delete $rootScope.system_messages[data.user_id+'_hide'];
                }, 15000);

                Room.getUserInfo(data.user_id,function(result){ 
                    $rootScope.system_messages[data.user_id+'_hide'] = {
                                                                             'message': result.user_profile.name+' stoped watching you.',
                                                                             'user': result.user_profile
                                                                            }
                    
                 });
            } else {

                // mark user as not watching in contact list
                delete $rootScope.women_watching['user_'+data.user_id];
                //**************************************

            }
        });

        $rootScope.$on('show_invite_notification',function(event,data){
            
            if(typeof $rootScope.chat_invitation == 'undefined' || $rootScope.chat_invitation == false)
            {
                
                if(typeof $rootScope.notifies[data.data.id] === 'undefined'){
                    $rootScope.notifies[data.data.id] = data.data;
                    $timeout(function(){ delete $rootScope.notifies[data.data.id] }, 15000);
                }
                
            }
            

        })

        $rootScope.$on('say_busy',function(event,data){

                    $rootScope.system_messages[data.user_id+'_show'] = {
                                                                             'message': data.message,
                                                                             'user': data.user_profile
                                                                            };
        })

        
        $rootScope.$on('contact_activate',function(event,data){

                    $rootScope.active_contacts['user_'+data.user_id] = true;
        })  
        
        $rootScope.$on('contact_deactivate',function(event,data){
                   
                   delete $rootScope.active_contacts['user_'+data.user_id];
                   
        })         


    })

.directive('opponentInfo', function() {

  return {
    scope: false,
    templateUrl: 'static/templates/directives/OpponentInfo.html'
  };
})

.directive('ngReallyClick', [function() {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            element.bind('click', function() {
                var message = attrs.ngReallyMessage;
                if (message && confirm(message)) {
                    scope.$apply(attrs.ngReallyClick);
                }
            });
        }
    }
}])


