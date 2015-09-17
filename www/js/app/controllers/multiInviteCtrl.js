/*"""
videoCtrl.js
``````````````


Multiply invitation.
 


*/

app.controller('multiInviteCtrl', function ($scope, $rootScope, $window, $log, Video, Online, Block, $interval, $http, Room, Contact, Auth, Status) {




      $rootScope.notifies = {}; 
      $scope.towho = 'online';

      $scope.multiInviteWindow = function(){


            Online.getOnline(function(result){

                 $scope.countOnline = result.user_list.length;
                 $scope.listOnline = result.user_list;
                 $.magnificPopup.open({
                  items: {
                    src: '#multi_invite_window'
                  },
                  type: 'inline'
                }, 0);  



            })         
        }

        $scope.updateOnline = function(){
            Online.getOnline(function(result){

                 $scope.countOnline = result.user_list.length;

            })                     
        }

        
        $scope.collapse = function(){

            $(document).find('.hid_but').on('click',function(event){
                event.preventDefault();
                $(this).closest(".message_girl").toggleClass('hidden_hid');
            });

        }

        $scope.remove = function(id){

           delete $rootScope.notifies[id];

        }

        $scope.goToRoom = function(contact_id,id){
            delete $rootScope.notifies[id];
            var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+contact_id;
            $window.location.href = url;
            Room.invite(contact_id,function(rezult){}); 
        }



        $scope.startSending = function(){

            var message = $(document).find('#multi_invite_text').html();

            if (message.length == 0) {
                alert('You can not sent empty message!');   
                return true;         
            }

            $scope.isSending = true;
            $scope.currentCursor = 0;
            $scope.sending_list = [];
            var index = 0;

            
            if($scope.towho=='online'){
                Online.getOnlineIds(function(result){
                    $scope.countUsersInvite = result.count;
                    if(result.count>0)
                    set_interval_sending(result.user_list);
                })
                
            } 

            if($scope.towho=='favorites'){
                Auth.getFavorites(function(result){
                    $scope.countUsersInvite = result.count;
                    if(result.count>0)
                    set_interval_sending(result.favorites.user_list)
                })
            }

            if($scope.towho=='contacts'){
                Contact.getContactListIds(function(result){

                    $scope.countUsersInvite = result.count;
                    if(result.count>0)
                    set_interval_sending(result.contact_list)
                })
            }       
     
            function set_interval_sending(user_list){
                    
                    $scope.invite_promise = $interval(function(){

                    opponent_id = user_list[index];
                    
                    var data = {
                                    'app_name': local_config.app_name, 
                                    'owner_id': $rootScope.currentUserId, 
                                    'opponent_id': opponent_id, 
                                    'message': message
                                };
                    $rootScope.$broadcast('multi_invite',data);
                      index += 1;  
                    }, 1000);
                
            }
            /*
                $scope.invite_promise = $interval(function(){

                opponent_id = $scope.sending_list[index].user_id;
                
                var data = {
                                'app_name': local_config.app_name, 
                                'owner_id': $rootScope.currentUserId, 
                                'opponent_id': opponent_id, 
                                'message': message,
                                'towho': $scope.towho
                            };
                $rootScope.$broadcast('multi_invite',data);
                  index += 1;  
                }, 1000);
            */
           
            
            
        }

         $scope.block = function(user_id,id){
            //alert(user_id+' blocking');
            Block.blockUser(user_id,function(result){
                $scope.is_blocked = true;
            })
            //delete $rootScope.notifies[id];
        }


         $scope.unblock = function(user_id,id){
            //alert(user_id+' blocking');
            Block.unblockUser(user_id,function(result){
                $scope.is_blocked = false;
            })
            //delete $rootScope.notifies[id];
        }

        $scope.close = function(opponent_id,notify_id){
            Status.sayClose(opponent_id, function(result){
                delete $rootScope.notifies[notify_id];
            })
        }


        $scope.stopSending = function(){
            $scope.isSending = false;
            $scope.currentCursor = 0;

            if (angular.isDefined($scope.invite_promise)) {
                $interval.cancel($scope.invite_promise);
                $scope.invite_promise = undefined;
            }

        }
        
        $rootScope.$on('multi_invite',function(event,data){

            Block.checkBlockUser(data.opponent_id,function(result){
                log(result);
                if(result.block=='no'){
                    var url = utils.prepare_url(apiconf.api.multi_invitation.url,{});
                    $http.post(url,data).success(function(){

                    }); 
                }
                $scope.currentCursor += 1;
                log($scope.currentCursor+'--'+$scope.countUsersInvite)
                if (parseInt($scope.currentCursor)==parseInt($scope.countUsersInvite)){
                    $interval.cancel($scope.invite_promise);
                    $scope.invite_promise = undefined;
                }
                
            }) 

            /*
            
            */

        })


        $rootScope.$on('show_multi_invite_notification',function(event,data){
            log($rootScope.chat_invitation);
            if(typeof $rootScope.chat_invitation == 'undefined' || $rootScope.chat_invitation == false)
            {
                $rootScope.notifies[data.data.id] = data.data;
            }

        })




 
      
     

    })

