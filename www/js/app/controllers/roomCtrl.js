 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, $log) {
        $scope.ws = WS;

        $scope.sendMessage = function(){
            alert($scope.room_participants);
            var message = $('#chat_content').find('#cTextDiv').html()
           Room.sendMessage($scope.room_id, message, $rootScope.currentUserId, $scope.room_participants, function(result) {
              $log.info(result);
              //$scope.messages = result.message;
              Room.getMessages($scope.room_id, function(result) {
              $log.info(result);
              $scope.messages = result.message;
              });  
              $('#chat_content').find('#cTextDiv').html("")    
            });
           
           $scope.message = '';
        };

        $scope.$on('show_message', function (event, data) {
           //alert(data.message);
        });

        
        $scope.$on('show_inv_win', function (event, data) {
            
        });

        $scope.$on('put_me_in_room', function (event, data) {
           $scope.room_participants = [apiconf.config.app_name+'_'+data.owner_id, apiconf.config.app_name+'_'+data.contact_id];
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




