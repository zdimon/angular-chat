 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, $log) {
        $scope.ws = WS;

        $scope.send = function(){
          WS.send({ action: 'send_message', tpa_name: apiconf.config.app_name, user_id: $rootScope.currentUserId, message: $scope.message }); 
          $scope.message = ''
        };

        $scope.$on('show_message', function (event, data) {
           alert(data.message);
        });

        $scope.$on('save_message', function (event, data) {
           alert(data.message);
        });
        
        $scope.$on('show_inv_win', function (event, data) {
            
        });

        $scope.$on('put_me_in_room', function (event, data) {
           $scope.room_participants = [apiconf.config.app_name+'_'+data.owner_id, apiconf.config.app_name+'_'+data.contact_id];
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




