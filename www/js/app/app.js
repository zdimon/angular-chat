/*"""
Services
````````

The function :func:`someService` does a some function.
*/


    var app = angular.module('AngularChatApp', [
        'ui.router',
        'restangular',
        'app.controllers',
        'ngCookies',
        'ngSanitize',
        'ng-socket'
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
})

.config(function($socketProvider){ 
    $socketProvider.configure({ address: local_config['ws_server'] }); 
})

.run(function ($rootScope, Auth, $window, Online, Status, $stateParams, $state, $timeout, Room, $socket) {

            // Initialization


             $socket.on("open", function(event, data){
                console.log($socket);
                $rootScope.$broadcast('connected');
                $('.wLost').hide();
             });

            
             $socket.start();


            $rootScope.$on('close', function (event, data) {
                console.log('close connection');
                $('.wLost').show();
            });



            $rootScope.$on('connected', function (event, data) {
                        
                        if (typeof $rootScope.current_opponent_id == 'undefined') {
			    $rootScope.current_opponent_id = 0;
                        }
                        if($rootScope.current_opponent_id.length != 0) {
                            $socket.send('connect',JSON.stringify({user_id: $rootScope.currentUserId, source: 'chat_side', tpa: 'tpa1com'}));
                            Auth.initialization($rootScope.current_opponent_id,function(result){
                                $rootScope.contact_user_list = result.contact.user_list;
                                $rootScope.online_user_list = result.online_except_contact.user_list;
                                $rootScope.online = {};
				$rootScope.my_image = result.owner.user_profile.image;
                                $rootScope.active_cams = {};
                                for (var i = 0; i < result.online_full.user_list.length; i++) {
                                    $rootScope.online['user_'+result.online_full.user_list[i].user_id] = true;
                                }  
                               
                                for (var i = 0; i < result.online_except_contact.user_list.length; i++) {
                                    if(result.online_full.user_list[i].is_camera_active)
                                     $rootScope.active_cams['user_'+result.online_full.user_list[i].user_id] = true;
                                } 
                          
                                Room.invite($rootScope.current_opponent_id,function(result){
                                    
                                            if(result.video_charging == true && result.opponent.gender == 'w') {
                                                $rootScope.$broadcast('show_opponent_video',{})
                                            }
                                            $('.preloader').remove();
                                            $rootScope.is_bootstrapted = true;
                                   
                                    })
                                

                                $rootScope.$broadcast('initializated',result);
                                
                            })
                        } 
            })  


            $rootScope.$on('$stateChangeStart', function (event, toState, toParams) {
                
                           event.preventDefault();
                           log(toParams);
                           $rootScope.currentUserId = toParams.user;    
                           $rootScope.current_opponent_id = toParams.opponent;
                           
                        
                       
              })

            Auth.isauth(function(result){
                if(result.id>0) {
                        //WS.send({ action: 'connect', user_id: $rootScope.currentUserId, source: 'chat_side' });
                        $socket.send('connect',JSON.stringify({user_id: $rootScope.currentUserId, source: 'chat_side', tpa: 'tpa1com'}));
                        $rootScope.isAuthenticated = true;  
                        $rootScope.currentUserId = result.id;
                        $rootScope.currentUsername = result.id;
                        $rootScope.balance = result.balance;
                        $rootScope.gender = result.gender;
                        $rootScope.system_messages = {};
                        $rootScope.waiting_to_responce = {};
                        $rootScope.men_watching = {};
                        $rootScope.closed_room_users = [];
                        $rootScope.women_watching = {};
                        $rootScope.hide_invite_button = {}; // TODO
                        $rootScope.is_bootstrapted = false;
                        $rootScope.new_messages = {};
                        $rootScope.active_contacts = {};
                        $rootScope.online = {};
                        $rootScope.i_am_watching = false
                        
                        $rootScope.close_system_message = function(win_id) {
                            delete $rootScope.system_messages[win_id];
                        }
                        
                        $rootScope.busy = function(opponent_id,notify_id){
                            Status.sayBusy(opponent_id, function(result){
                                delete $rootScope.notifies[notify_id];
                            })

                        }


                        $rootScope.acceptChatFromPopup = function(opponent_id,id){
                           
                            delete $rootScope.system_messages[id];
                            var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+opponent_id;
                            $window.location.href = url;
                            Room.invite(opponent_id,function(rezult){}); 

                        }                        


                        // show popup alert to force user to top account
                        $rootScope.emptyAccountAlert = function(){
                                     $.magnificPopup.open({
                                      items: {
                                        src: '#empty_account_alert'
                                      },
                                      type: 'inline'
                                    }, 0); 
                                    $(document).find('#opponentVideo').empty();          
                            }



                         
                       

                    } else { $rootScope.isAuthenticated = false;}

                  // watch changes of allow invitation trigger TODO
                  $rootScope.$watch('chat_invitation', function() {
                         
                         if($rootScope.is_bootstrapted == true  ){
                            if($rootScope.chat_invitation == false || typeof $rootScope.chat_invitation == 'undefined') {
                            
                                    Status.acceptInvitation(function(result){
                                                 
                                    })
                            } else {
                                    Status.declineInvitation(function(result){
                                                 
                                    })
                            }
                           
                         }
                     
                    });

    


            })
        
  
                  

})

