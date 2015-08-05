 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, GoogleTranslate, $log) {
        $scope.ws = WS;


        /*"""
        .. function:: $scope.translate()

            Function use GoogleTranslator service and translate mrssage from russuan to english in the textarea.
    
           
        */

        $scope.translate = function(){
            var message = $(document).find('#chat_message').html();
            $log.debug(message);
            GoogleTranslate.translate('ru','en',message).then(function(resulf){
              $(document).find('#chat_message').html(resulf);
            });
            
            
        };

        $scope.sendMessage = function(){
            var message = $(document).find('#chat_message').html()
           Room.sendMessage($scope.room_id, message, $rootScope.currentUserId, $scope.room_participants, function(result) {
              Room.getMessages($scope.room_id, function(result) {
              $scope.messages = result.message;
              });  
              $('#chat_content').find('#cTextDiv').html("")    
            });
        };

        $scope.$on('show_message', function (event, data) {
            //if ($scope.room_id==data.room_id) {
           Room.getMessages($scope.room_id, function(result) {
              $scope.messages = result.message;
              scroolldown();
              }); 
            
            //}
        });

        
        $scope.$on('show_inv_win', function (event, data) {
            
        });

         $scope.$on('hello', function (event, data) {
            alert('hello');
        });

        $scope.$on('put_me_in_room', function (event, data) {
           $scope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $scope.room_id = data.room_id;
           $scope.hasActiveRoom=true;
           Room.getUserInfo(data.contact_id,function(result){ 
            $scope.opponent = result.user_profile
         });
            $log.info(data.room_id);
           Room.getMessages(data.room_id, function(result) {
              $log.info(result);
              $scope.messages = result.message;
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


