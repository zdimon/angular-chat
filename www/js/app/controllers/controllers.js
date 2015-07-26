angular.module('app.controllers', [])
    
    .controller('RegistrationController', function($scope,Auth) {
        
      $scope.submit = function() {
        Auth.register($scope.model.username,$scope.model.password).success(function(result) {
            $scope.result = result 
            console.log($scope.result);
        });


        

      };

   


    })

    
 .controller('UserOnlineCtrl', function ($scope, Online , WS) {
        
        $scope.update = function(){
          Online.getOnline(function(rezult){
                $scope.user_list = rezult.user_list;
            }) 
        }
        $scope.update()

        $scope.$on('update_users_online', function (event, data) {
           $scope.update()
        });



    })

 .controller('ContactListCtrl', function ($scope, Contact) {
      $scope.update = function(){
       
      }
      $scope.update()
    })

 .controller('RoomCtrl', function ($scope, WS, $rootScope) {
      $scope.ws = WS;

        $scope.send = function(){
          WS.send({ action: 'send_message', tpa_name: apiconf.config.app_name, user_id: $rootScope.currentUserId, message: $scope.message }); 
          $scope.message = ''
        }

        $scope.$on('send_message', function (event, data) {
           alert(data.message);
        });

    })

 .controller('MyVideoCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })

 .controller('OpponentVideoCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })





