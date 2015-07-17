angular.module('app.controllers', [])
    
    .controller('RegistrationController', function($scope,Auth) {
        
      $scope.submit = function() {
        Auth.register($scope.model.username,$scope.model.password).success(function(result) {
            $scope.result = result 
            console.log($scope.result);
        });
        

      };

   


    })

    
 .controller('ChatUserOnline', function ($scope, WS) {
      $scope.ws = WS;
    });






