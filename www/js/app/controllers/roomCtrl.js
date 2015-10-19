 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, GoogleTranslate, $log, $http, $window, $timeout) {
        $scope.ws = WS;
        var text_changed = 0;
        scroolldown();

        $scope.stopChat = function(opponent_id){
            /* add opponent to closed_room_users list
               to prevent sound alert in reapeted messages
            */
            $scope.closed_room_users.push(opponent_id);
            log($scope.closed_room_users);
            ///////////////////////////////////////////

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

            var message = $(document).find('#chat_message').html()

            chm = message.replace('<br>','');
            if(chm.length>0) {
            
           Room.sendMessage($scope.room_id, message, $rootScope.currentUserId, $scope.room_participants, $rootScope.gender, function(result) {
              log(result);



              if(result.status==1) {
                    $rootScope.emptyAccountAlert(); // when user has not money
                } else { 
                    $(document).find('#chat_message').html("");
                    text_changed = 0;
                    // mark opponent as waiting to responce
                    for (var i = 0; i < result.participants.length; i++) {
                        $rootScope.waiting_to_responce['user_'+result.participants[i]] = true;
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

              
  
              // unmark room as closed
                for (var i = 0; i < data.message.message.participants.length; i++) {
                    var user_id = parseInt(data.message.message.participants[i].split('_')[1]);
                    if(user_id!=data.message.message.owner.user_id){
                        
                        var index = $scope.closed_room_users.indexOf(user_id);
                        
                        if (index > -1) {
                             $scope.closed_room_users.splice(index, 1);
                        }               
                    }
                }

              
              ////////////////////////

              // mark user as is not waiting to responce 
              delete $rootScope.waiting_to_responce['user_'+data.message.message.owner.user_id]
              //****************************************


               //TODO message.message
              if(data.message.message.room_id != $scope.room_id){
                    
                    // blinking title                    
                    $scope.blink_title_interval = setInterval(blinkTitle, 700);
                    

                    //log(data.message.message.room_id +'!='+ $scope.room_id);
                   // set envelop blinking (new message) or show pop up in man case 
                   if($rootScope.gender=='m') {
                        $rootScope.$broadcast('show_invite_notification',{'id': data.message.message.owner.user_id, 'data':{ 'message': data.message.message.message, 'opponent': data.message.message.owner}});
                    } else {
                       for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                            if($rootScope.contact_user_list[i].user_id==data.message.message.owner.user_id) {
                                $rootScope.contact_user_list[i].has_new_message = true;
                            }
                       }
                    }

                     // sound in unactive chat for women
                     if(data.message.message.owner.user_id!=$rootScope.currentUserId  && $scope.closed_room_users.indexOf(data.message.message.owner.user_id) == -1 && $rootScope.gender == 'w' )  {
                        alert('1');
                        document.getElementById('audio_alert').play();
                     }

              } else {
                     $rootScope.feather = false;
                  
                     // sound in current chat for all
                     if(data.message.message.owner.user_id!=$rootScope.currentUserId  && $scope.closed_room_users.indexOf(data.message.message.owner.user_id) == -1 )  {
                        alert('2');
                        document.getElementById('audio_alert').play();
                     }

                      if($scope.chat_translate==true){

                             GoogleTranslate.translate('en','ru',data.message.message.message).then(function(resulf){
                             data.message.message.translated_message = resulf;
                             $scope.messages.push(data.message.message);
                            });


                       } else {

                        $scope.messages.push(data.message.message);

                       }
              }

               scroolldown();      
                

            
        });

        
        

        

        $scope.$on('put_me_in_room', function (event, data) {
           var isOldTitle;
           log(data);
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
		       $window.location.href = url; 
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
                }, 5000);

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
                }, 5000);

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
                $rootScope.notifies[data.data.id] = data.data;
            }
            

        })

        $rootScope.$on('say_busy',function(event,data){

                    $rootScope.system_messages[data.user_id+'_show'] = {
                                                                             'message': data.message,
                                                                             'user': data.user_profile
                                                                            };

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


