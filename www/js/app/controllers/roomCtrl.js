 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope) {
        $scope.ws = WS;

        $scope.send = function(){
          WS.send({ action: 'send_message', tpa_name: apiconf.config.app_name, user_id: $rootScope.currentUserId, message: $scope.message }); 
          $scope.message = ''
        }

        $scope.$on('send_message', function (event, data) {
           alert(data.message);
        });

        $scope.$on('put_me_in_room', function (event, data) {
           $scope.hasActiveRoom=true
        });

    })

.directive('opponentInfo', function() {

  return {
    scope: {
      customerInfo: '=info'
    },
    templateUrl: 'static/templates/directives/OpponentInfo.html'
  };
})




