
    
 app.controller('UserOnlineCtrl',
        
        function ($scope, Online , Contact, Room, $rootScope, $window) {
     
         $scope.send_message = function(user_id){

           Room.getUserInfo(user_id,function(result){ 
            $scope.message_user = result.user_profile
         });

            $.magnificPopup.open({
              items: {
                src: '#message_window'
              },
              type: 'inline'
            }, 0);

        };
        

        $scope.submit_message = function(){
        /*"""
        .. function:: $scope.submit_message()

        Send message to inbox.

        1. Get message.

        2. Send message to the opponent.

        3. Clear text box.

        4. Close popup window.

           
        */ 
           //1
           var message = $(document).find('#mess_text').html();
           //2
          Online.sendMessage($rootScope.currentUserId, $scope.message_user.user_id, message, function(result) {
          //3,4 
                 $(document).find('#mess_text').html('');
                 $.magnificPopup.close({
                  items: {
                    src: '#message_window'
                  }});
          }); 
           


        }

   
        $scope.update = function(){

          Online.getOnlineExceptContact(function(rezult){
                $scope.online_user_list = rezult.user_list;
            }) 
        };

        //$scope.update();

        $scope.$on('update_users_online', function (event, data) {   
           $scope.update();
        });
        
        

      $scope.addContact = function(contact_id){
          Contact.addContact(contact_id,function(rezult){
            $rootScope.$emit('update_contact');
            })
        };

        $scope.invite = function(contact_id,withVideo){
            
            var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+contact_id;
            $window.location.href = url;
           
            
            Room.invite(contact_id,function(rezult){
                $rootScope.$broadcast('update_users_online');   
                if(withVideo) $rootScope.$broadcast('show_opponent_video');
                
            }); 
        }


    })
