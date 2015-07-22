angular.module('app.controllers', [])
    
    .controller('RegistrationController', function($scope,Auth) {
        
      $scope.submit = function() {
        Auth.register($scope.model.username,$scope.model.password).success(function(result) {
            $scope.result = result 
            console.log($scope.result);
        });
        

      };

   


    })

    
 .controller('UserOnlineCtrl', function ($scope, WS, Online) {
        $scope.ws = WS;
        $scope.update = function(){
          Online.getOnline(function(rezult){
                $scope.user_list = rezult.user_list;
            }) 
        }
        $scope.update()
    })

 .controller('ContactListCtrl', function ($scope, Contact) {
      $scope.ws = WS;
      $scope.update = function(){
        Online.getContactList(function(rezult){
              $scope.contact_list = rezult.contact_list;
          }) 
      }
      $scope.update()
    })

 .controller('CurrentRoomCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })

 .controller('MyVideoCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })

 .controller('OpponentVideoCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })





