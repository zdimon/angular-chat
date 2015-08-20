 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, GoogleTranslate, $log, $http) {
        $scope.ws = WS;
        scroolldown();

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
              log(message.length);
              if(result.status==1) {
                    $rootScope.emptyAccountAlert(); // when user has not money
                } else { 
                    $(document).find('#chat_message').html("");
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

              if($rootScope.new_messages === 'undefined') $rootScope.new_messages = []
              
              console.log(data);

              if(data.message.message.owner.user_id!=$rootScope.currentUserId){
                    document.getElementById('audio_alert').play();
                }

              if(data.message.message.room_id != $scope.room_id){
                    
                    $rootScope.new_messages['user_'+data.message.message.owner.user_id] = true;
                    console.log($scope.new_messages['user_'+data.message.message]);

              } else {

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
           var text_changed = 0;
           $rootScope.feather = false;
           $scope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $rootScope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $scope.room_id = data.room_id;
           $rootScope.room_id = data.room_id;
           $scope.hasActiveRoom=true;
           if(data.contact.is_camera_active) $rootScope.isOpponentVideoActive = true;
           Room.getUserInfo(data.contact_id,function(result){ 
            $scope.opponent = result.user_profile
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
            
            log(data);

            if(data.room_id==$rootScope.room_id){
            $rootScope.feather = true;
            }
          

        })


        

        $rootScope.$on('show_invite_notification',function(event,data){
            
            if(typeof $rootScope.chat_invitation == 'undefined' || $rootScope.chat_invitation == false)
            {
                $rootScope.notifies[data.data.id] = data.data;
            }
            log($rootScope.notifies);

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


