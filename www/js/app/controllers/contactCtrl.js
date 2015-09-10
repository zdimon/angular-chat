/*"""
contactCtrl.js
``````````````


 Populate contact list.
 


*/

app.controller('ContactListCtrl', function ($scope, Contact, $rootScope, $window, Room, $log) {


      $scope.watch_profile = {}

        /*"""
        .. function:: $scope.$on('rootScope_ready'...

           
        */ 

      $scope.$on('rootScope_ready',function(event, data){
            $scope.update();
      })


        /*"""
        .. function:: $scope.$on('update_contact'...

           
        */ 

      $rootScope.$on('update_contact',function(event, data){
            $scope.update();
      })


        /*"""
        .. function:: $scope.$on('set_me_online'...

           Check if this user is in this contact list we will update this contact list.

        */ 

      $rootScope.$on('set_me_online',function(event, data){
           
           $rootScope.online_user_list['user_'+data.message.uid] = true;
           /*
           for(key in $scope.contact_list){
                if ($scope.contact_list[key].user_id == data.message.uid) {
                    $scope.update();
                }
              
            }
           */
           
      })


        /*"""
        .. function:: $scope.$on('add_me_to_contact_list'...

           Check if this user is in this contact list we will update this contact list.

        */

      $rootScope.$on('add_me_in_contact_list',function(event, data){


           Contact.addContact(data.message.user_id,function(){
               $scope.online['user_'+data.message.user_id] = true;
               $scope.update();

           })

      })

      $rootScope.$on('mark_watching_profile',function(event, data){
            log(data);
            $scope.watch_profile['user_'+data.user_id] = true;
      })

      $rootScope.$on('set_me_offline',function(event, data){
            log(data);
            delete $scope.watch_profile['user_'+data.message.uid];
      })


        /*"""
        .. function:: $scope.$on('set_me_offline'...

           Check if this user is in this contact list we will update this contact list.

        */ 

      $rootScope.$on('set_me_offline',function(event, data){
           
           $rootScope.online_user_list['user_'+data.message.uid] = false;
           /*
           for(key in $scope.contact_list){
                if ($scope.contact_list[key].user_id == data.message.uid) {
                    $scope.update();
                }
              
            }
            */
           
      })


        /*"""
        .. function:: $scope.delete()

           
        */ 

      $scope.delete = function(contact_id){
          Contact.delContact(contact_id,function(rezult){
            $scope.update()
            $rootScope.$broadcast('update_users_online');
            })
        }

        /*"""
        .. function:: $scope.update()

           
        */ 

      $scope.update = function(){
        Contact.getContactList(function(rezult){
                $scope.contact_user_list = rezult.user_list;
            })       
      }

     

      $scope.deleteAll = function(){
          Contact.deleteAll(function(rezult){
            $scope.update();
            $rootScope.$broadcast('update_users_online');
            })
        }

        /*"""
        .. function:: $scope.invite()

        Invites man from woman. Use as multiply invitation for all users whith are online.

        1. Make request to get user profile by id.        

        2. Put profile into scope.

        3. Show popup window.

        :param: contact_id
           
        */ 

        $scope.invite_window = function(contact_id){

           //1,2
           Room.getUserInfo(contact_id,function(result){ 
            $scope.invited_user = result.user_profile
         });
        
           //3
            $.magnificPopup.open({
              items: {
                src: '#invite_window'
              },
              type: 'inline'
            }, 0);


        }


        /*"""
        .. function:: $scope.submit_invitation()

        Send invitation message to men.

        1. Get message.

        2. Send message to the opponent.

        3. Clear text box.

        4. Close popup window.

           
        */ 

        $scope.submit_invitation = function(){

           //1
           var message = $(document).find('#inv_text').html();
           //2
          Contact.sendInvitation($rootScope.currentUserId, $scope.invited_user.user_id, message, function(result) {
          //3,4 
                 $(document).find('#inv_text').html('');
                 $.magnificPopup.close({
                  items: {
                    src: '#invite_window'
                  }});
          }); 
           


        }



        $scope.select = function(contact_id){
         
            var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+contact_id;
            $window.location.href = url;
            Room.invite(contact_id,function(rezult){


            }); 
        }

     

    })

