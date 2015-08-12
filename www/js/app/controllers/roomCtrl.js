 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, GoogleTranslate, $log) {
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
           
            And makes request via Room service Room.sendMessage()

            Then clears textarea $(document).find('#chat_message').html("")
        */

        $scope.sendMessage = function(){
            var message = $(document).find('#chat_message').html()
           Room.sendMessage($scope.room_id, message, $rootScope.currentUserId, $scope.room_participants, function(result) {
             // Room.getMessages($scope.room_id, function(result) {
             // $scope.messages = result.message;
             // });  
              $(document).find('#chat_message').html("")    
            });
        };


        /*"""
        .. function:: $scope.$on('show_message'

            Function updates message list if message gose to the current active room.

            Else it set $scope.new_messages.user_<user_id> var to show indicator.
    
            If transtation option $scope.chat_translate is enabled it translate the message.
            
        */

        $scope.$on('show_message', function (event, data) { 
              $rootScope.new_messages = {'ddd':'dddd'}
              console.log(data);
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

        
        $scope.$on('show_inv_win', function (event, data) {
            
        });

        

        $scope.$on('put_me_in_room', function (event, data) {
           
           $scope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $rootScope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $scope.room_id = data.room_id;
           $rootScope.room_id = data.room_id;
           $scope.hasActiveRoom=true;
           if(data.contact.is_camera_active) $rootScope.isOpponentVideoActive = true;
           Room.getUserInfo(data.contact_id,function(result){ 
            $scope.opponent = result.user_profile
         });
            $log.info(data.room_id);
           Room.getMessages(data.room_id, function(result) {
              
              $scope.messages = result.message;
              setTimeout(function(){scroolldown(),1000});
         });

        });


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


