

angular.module('app.controllers', [])
        
    .controller('RegistrationController', function($scope,Auth) {

      $scope.submit = function() {
        Auth.register($scope.model.username,$scope.model.password).success(function(result) {
            $scope.result = result 
            console.log($scope.result);
        });


        

      };

   


    })

 /**
 * Populate users online
 * @Online - service that provids requests to get users online
 * @WS - websocket service
 * @name dddd
 */
    
 .controller('UserOnlineCtrl', 
        /** Constructor
        *@name updatescope         
         **/
        function ($scope, Online , WS) {
     
         
   
        $scope.update = function(){
          Online.getOnline(function(rezult){
                $scope.user_list = rezult.user_list;
            }) 
        }
        $scope.update()

         /**
         * Subscribing on event update_users_online that comes from websocket service.
         * @name ffff
         */

        $scope.$on('update_users_online', function (event, data) {
           $scope.update()
        });



    })

 .controller('ContactListCtrl', function ($scope, Contact) {
      $scope.update = function(){
        Contact.getContactList(function(rezult){
                $scope.contact_list = rezult.contact_list;
            })       
      }
      $scope.$on('rootScope_ready',function(event, data){

            $scope.update();

      })
      $scope.delete = function(contact_id){
          Contact.delContact(contact_id,function(rezult){
            $scope.update()
            })
        }

      $scope.deleteAll = function(){
            alert("Trudsfdfsdfsdfsd----------");
          Contact.deleteAll(function(rezult){
            $scope.update()
            })
        }
    })


 .controller('InvitationCtrl', function ($scope, WS, $rootScope) {
        $scope.ws = WS;
        $scope.show_intitation = true;
        $scope.close = function(){
            $scope.show_intitation = false;
        }
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





