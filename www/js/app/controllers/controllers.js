

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
        
        function ($scope, Online , WS, Contact, Room, $rootScope, $window) {
     
         
   
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
            
            var url = "http://" + apiconf.config.chat_url + "#/" + $rootScope.currentUserId+'/'+contact_id;
            $window.location.href = url;
            Room.invite(contact_id,function(rezult){
$rootScope.$broadcast('update_users_online');
            }); 
        }

    })

 .controller('ContactListCtrl', function ($scope, Contact, $rootScope, $window, Room) {
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
            $rootScope.$broadcast('update_users_online');
            })
        }

      $scope.deleteAll = function(){
          Contact.deleteAll(function(rezult){
            $scope.update();
            $rootScope.$broadcast('update_users_online');
            })
        }

        $scope.invite = function(contact_id){
            
            var url = "http://" + apiconf.config.chat_url + "#/" + $rootScope.currentUserId+'/'+contact_id;
            $window.location.href = url;
            Room.invite(contact_id,function(rezult){}); 
        }

    })


 .controller('InvitationCtrl', function ($scope, WS, $rootScope) {
        $scope.ws = WS;
        $scope.show_intitation = true;
        $scope.close = function(){
            $scope.show_intitation = false;
        }
    })




 .controller('MyVideoCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })

 .controller('OpponentVideoCtrl', function ($scope, WS) {
      $scope.ws = WS;
    })





