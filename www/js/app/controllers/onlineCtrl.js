
    
 app.controller('UserOnlineCtrl',
        
        function ($scope, Online , WS, Contact, Room, $rootScope, $window) {
     
         
   
        $scope.update = function(){

          Online.getOnlineExceptContact(function(rezult){
                $scope.user_list = rezult.user_list;
            }) 
        };

        $scope.update();

        $scope.$on('update_users_online', function (event, data) {   
           $scope.update();
        });
        
        

      $scope.addContact = function(contact_id){
          Contact.addContact(contact_id,function(rezult){
            $rootScope.$emit('update_contact');
            })
        };

        $scope.invite = function(contact_id){
            
            var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+contact_id;
            $window.location.href = url;
            Room.invite(contact_id,function(rezult){
                $rootScope.$broadcast('update_users_online');
            }); 
        }

    })
