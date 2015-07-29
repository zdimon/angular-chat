

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

/*"""
UserOnlineCtrl
``````````````
*/
    
 .controller('UserOnlineCtrl',
        
        function ($scope, Online , WS, Contact, Room, $rootScope) {
     
         
   
        $scope.update = function(){
        /*"""
        .. function:: $scope.update()

            Make request throw Online service.
    
            :pattern: [server]/api/[app_name]/get_online

            :example: http://chat.localhost/api/tpa1com/get_online
            
            :result: Update  $scope.user_list parameter.
        */
          Online.getOnline(function(rezult){
                $scope.user_list = rezult.user_list;
            }) 
        };
        $scope.update();



        $scope.$on('update_users_online', function (event, data) {
        /*"""
        .. js:attribute:: $scope.$on
            
            :result: Subscribing on event update_users_online that comes from websocket service.
        */        
           $scope.update()
        });
        
        

      $scope.addContact = function(contact_id){
          Contact.addContact(contact_id,function(rezult){
            $rootScope.$emit('update_contact');
            })
        };

        $scope.invite = function(contact_id){
            Room.invite(contact_id,function(rezult){
            $scope.update()
            })
        }

    })

 .controller('ContactListCtrl', function ($scope, Contact, $rootScope) {
      $scope.update = function(){
        Contact.getContactList(function(rezult){
                $scope.contact_list = rezult.contact_list;
            })       
      }
      $scope.$on('rootScope_ready',function(event, data){

            $scope.update();

      })
      $rootScope.$on('update_contact',function(event, data){
            $scope.update();

      })

      $scope.delete = function(contact_id){
          Contact.delContact(contact_id,function(rezult){
            $scope.update()
            })
        }

      $scope.deleteAll = function(){
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

 .controller('RoomCtrl', function ($scope, WS, Room, $rootScope) {
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





