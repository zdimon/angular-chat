






    var app = angular.module('AngularChatApp', [
        'ui.router',
        'restangular',
        'app.controllers',
        'ngCookies',
        'ngSanitize',
        'ngWebSocket' 
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
})


.run(function ($rootScope, Auth, $window, WS, Online, Status, $stateParams, $state, $timeout, Room, WS) {



            $rootScope.$on('connected', function (event, data) {

                        if (typeof $rootScope.current_opponent_id == 'undefined') {
			    $rootScope.current_opponent_id = 0;
                        }
                        if($rootScope.current_opponent_id.length != 0) {

                            Auth.initialization($rootScope.current_opponent_id,function(result){
                                $rootScope.contact_user_list = result.contact.user_list;
                                $rootScope.online_user_list = result.online_except_contact.user_list;
                                $rootScope.online = {};
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
                        WS.send({ action: 'connect', user_id: $rootScope.currentUserId, source: 'chat_side' });
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
                        $rootScope.hide_invite_button = {}; 
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


                        $rootScope.emptyAccountAlert = function(){
                                     $.magnificPopup.open({
                                      items: {
                                        src: '#empty_account_alert'
                                      },
                                      type: 'inline'
                                    }, 0);           
                            }






                                                                    } else { $rootScope.isAuthenticated = false;}

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

;

angular.module('app.controllers', [])

            .controller('RegistrationController', function($scope,Auth) {

      $scope.submit = function() {
        Auth.register($scope.model.username,$scope.model.password).success(function(result) {
            $scope.result = result 
            console.log($scope.result);
        });




              };




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





; 


app.controller('RoomCtrl', function ($scope, WS, Room, $rootScope, GoogleTranslate, $log, $http, $window, $timeout, Status) {
        $scope.ws = WS;
        var text_changed = 0;
        var audio_alerts = {};
        scroolldown();



        $scope.stopChat = function(opponent_id){
            $scope.closed_room_users.push(opponent_id);
            log($scope.closed_room_users);

           delete $rootScope.active_contacts['user_'+opponent_id]; 
           log($rootScope.active_contacts);           

                    Room.closeRoom(opponent_id,function(result){
                var url = "http://" + local_config.chat_url  + "#/" + $rootScope.currentUserId;  
                $scope.hasActiveRoom = false;
                $window.location.href = url;       
                $scope.room_just_closed = true;        
            })

                    }


        $scope.translate = function(){
            var message = $(document).find('#chat_message').html();
            $log.debug(message);
            GoogleTranslate.translate('ru','en',message).then(function(resulf){
              $(document).find('#chat_message').html(resulf).focus();

                            });


                                };


        $scope.sendMessage = function(){


                                     var message = $(document).find('#chat_message').html();

            $scope.tm = Date.now();

            chm = message.replace('<br>','');
            if(chm.length>0) {

                       Room.sendMessage($scope.room_id, message, $rootScope.currentUserId, $scope.room_participants, $rootScope.gender, function(result) {




                               if(result.status==1) {
                    $rootScope.emptyAccountAlert(); 
                } else { 
                    $(document).find('#chat_message').html("");
                    text_changed = 0;
                    for (var i = 0; i < result.participants.length; i++) {
                        $rootScope.waiting_to_responce['user_'+result.participants[i]] = true;
                        delete audio_alerts[result.participants[i]];
                    }              
                    } 

                          });

            }
        };







        $scope.$on('show_message', function (event, data) { 

              var def = Date.now()-$scope.tm



                                           if(def>1500 && data.message.message.owner.user_id==$rootScope.currentUserId){

                                        Status.restartServer(function(rezult){
                        alert('Sorry, but we have got some problem with the chat server and you page wil be reloaded in 15 sec. Please copy yor message if you have something wrote.');
                    });
              }



                for (var i = 0; i < data.message.message.participants.length; i++) {
                    var user_id = parseInt(data.message.message.participants[i].split('_')[1]);
                    if(user_id!=data.message.message.owner.user_id){

                                                var index = $scope.closed_room_users.indexOf(user_id);

                                                if (index > -1) {
                             $scope.closed_room_users.splice(index, 1);
                        }               
                    }
                }



              delete $rootScope.waiting_to_responce['user_'+data.message.message.owner.user_id]

             if($rootScope.gender=='m'){
                 if(
                    data.message.message.owner.user_id!=$rootScope.currentUserId  
                    && $scope.closed_room_users.indexOf(data.message.message.owner.user_id) == -1 
                    && $rootScope.active_contacts['user_'+data.message.message.owner.user_id]
                    && audio_alerts[data.message.message.owner.user_id] != 'true'
                    ){
                    mySound.play();
                    document.getElementById('audio_alert').play();
                    audio_alerts[data.message.message.owner.user_id] = 'true';

                                     }
              } else {

                 if(data.message.message.owner.user_id!=$rootScope.currentUserId)  {
                 }                

              }


                    if(data.message.message.owner.user_id!=$rootScope.currentUserId){               
                        $scope.blink_title_interval = setInterval(blinkTitle, 700);
                    } else {
                        clearInterval($scope.blink_title_interval);
                    }

              if(data.message.message.room_id != $scope.room_id){




                   for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                        if($rootScope.contact_user_list[i].user_id==data.message.message.owner.user_id) {
                            $rootScope.contact_user_list[i].has_new_message = true;
                        }
                   }                  

                   if($rootScope.gender=='m' && !$rootScope.active_contacts['user_'+data.message.message.owner.user_id]) {
                    } 


              } else {




                     $rootScope.feather = false;



                                        if($scope.chat_translate==true){


                                                                                      GoogleTranslate.translate('en','ru',data.message.message.message).then(function(resulf){
                             data.message.message.translated_message = resulf;
                             $scope.messages.push(data.message.message);
                             GoogleTranslate.save_translate(data.message,resulf); 
                            });


                       } else {

                        $scope.messages.push(data.message.message);

                       }
              }

               scroolldown();      



                                    });






                                $scope.$on('put_me_in_room', function (event, data) {
           var isOldTitle;
           $rootScope.feather = false;
           $scope.room_just_closed = false;
           $scope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $rootScope.room_participants = [local_config.app_name+'_'+data.owner_id, local_config.app_name+'_'+data.contact_id];
           $scope.room_id = data.room_id;
           $rootScope.room_id = data.room_id;
           $scope.hasActiveRoom=true;

            clearInterval($scope.blink_title_interval);
            document.title = oldTitle;

	                   for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                if($rootScope.contact_user_list[i].user_id==data.contact_id) {
                    $rootScope.contact_user_list[i].has_new_message = false;
                    $rootScope.contact_user_list[i].activity = data.contact_data.activity;
                }
           }

                      if(data.contact.is_camera_active) $rootScope.isOpponentVideoActive = true;
           Room.getUserInfo(data.contact_id,function(result){ 
            $scope.opponent = result.user_profile;
            $rootScope.current_opponent_id = data.contact_id;
            $rootScope.current_opponent = result.user_profile;
            if(result.user_profile.is_camera_active==true) {
                $rootScope.isOpponentVideoActive = true;
            } else {
                $rootScope.isOpponentVideoActive = false;
            }
         });

               Room.getMessages(data.room_id, function(result) {

                            $scope.messages = result.message;

                    setTimeout(function(){scroolldown(),1000});

              $(document).find('#chat_message').bind("DOMSubtreeModified",function(){

                                    if (text_changed==0){

                                      Room.showFeather(data.contact.user_id, function(result) {


                                               });
                  }
                  text_changed = 1;
                });

         });

        });

        $rootScope.$on('show_feather',function(event,data){
            if(data.room_id==$rootScope.room_id){
             $rootScope.feather = true;
            }
        })

        $rootScope.$on('update_balance',function(event,data){
            $rootScope.balance = data.balance;
            if(data.status==1){
                $rootScope.emptyAccountAlert();
            }
        })


        $rootScope.$on('close_room',function(event,data){
	       if(data.room_id==$scope.room_id){
		       $scope.room_just_closed = true;
               $scope.closed_room_users.push(parseInt(data.user_id));
		       var url = "http://" + local_config.chat_url  + "#/" + $rootScope.currentUserId;  
		       $scope.hasActiveRoom = false;
	      }     
        })

         $scope.$on('i_started_watching_you', function (event, data) {

                      if($rootScope.gender=='w') {


                $rootScope.men_watching['user_'+data.user_id] = true;

                $timeout(function(){
                    delete $rootScope.system_messages[data.user_id+'_show'];
                }, 15000);

                Room.getUserInfo(data.user_id,function(result){ 
                    $rootScope.system_messages[data.user_id+'_show'] = {
                                                                             'message': result.user_profile.name+' started watching you.',
                                                                             'user': result.user_profile
                                                                            }

                                     });

                            } else {
                $rootScope.women_watching['user_'+data.user_id] = true;

            }
        });

                 $scope.$on('i_stopted_watching_you', function (event, data) {
           if($rootScope.gender=='w') {              

                delete $rootScope.men_watching['user_'+data.user_id];

                $timeout(function(){
                    delete $rootScope.system_messages[data.user_id+'_hide'];
                }, 15000);

                Room.getUserInfo(data.user_id,function(result){ 
                    $rootScope.system_messages[data.user_id+'_hide'] = {
                                                                             'message': result.user_profile.name+' stoped watching you.',
                                                                             'user': result.user_profile
                                                                            }

                                     });
            } else {

                delete $rootScope.women_watching['user_'+data.user_id];

            }
        });

        $rootScope.$on('show_invite_notification',function(event,data){

                        if(typeof $rootScope.chat_invitation == 'undefined' || $rootScope.chat_invitation == false)
            {

                                if(typeof $rootScope.notifies[data.data.id] === 'undefined'){
                    $rootScope.notifies[data.data.id] = data.data;
                    $timeout(function(){ delete $rootScope.notifies[data.data.id] }, 15000);
                }

                            }


                    })

        $rootScope.$on('say_busy',function(event,data){

                    $rootScope.system_messages[data.user_id+'_show'] = {
                                                                             'message': data.message,
                                                                             'user': data.user_profile
                                                                            };
        })


                $rootScope.$on('contact_activate',function(event,data){

                    $rootScope.active_contacts['user_'+data.user_id] = true;
        })  

                $rootScope.$on('contact_deactivate',function(event,data){

                                      delete $rootScope.active_contacts['user_'+data.user_id];

                           })         


    })

.directive('opponentInfo', function() {

  return {
    scope: false,
    templateUrl: 'static/templates/directives/OpponentInfo.html'
  };
})

.directive('ngReallyClick', [function() {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            element.bind('click', function() {
                var message = attrs.ngReallyMessage;
                if (message && confirm(message)) {
                    scope.$apply(attrs.ngReallyClick);
                }
            });
        }
    }
}])


;

     app.controller('UserOnlineCtrl',

                function ($scope, Online , WS, Contact, Room, $rootScope, $window) {

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
           var message = $(document).find('#mess_text').html();
          Online.sendMessage($rootScope.currentUserId, $scope.message_user.user_id, message, function(result) {
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
;

app.controller('ContactListCtrl', function ($scope, Contact, $rootScope, $window, Room, $log, Online) {


      $scope.watch_profile = {}






      $rootScope.$on('update_contact',function(event, data){
            $scope.update();
      })



      $rootScope.$on('set_me_online',function(event, data){

                      $rootScope.online['user_'+data.message.uid] = true;

                for(key in $rootScope.contact_user_list){

                                if ($rootScope.contact_user_list[key].user_id == data.message.uid) {
                    $rootScope.contact_user_list[key].is_online = 1;
                }

                          }


                            })



      $rootScope.$on('add_me_in_contact_list',function(event, data){


                                Contact.addContact(data.user_id,function(){

               data.profile.has_new_message = true;
               $scope.contact_user_list.push(data.profile);
               $scope.online['user_'+data.user_id] = true;


                              $rootScope.system_messages[data.user_id+'_hide'] = {
                                                                     'message': data.profile.name+' just sent you new message.',
                                                                     'user': data.profile
                                                                  }

               $rootScope.$broadcast('update_users_online'); 


                                         })


                 })


        $rootScope.$on('add_opponent_in_my_contact_list',function(event, data){


                               var is_exist = false;

                      for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                if($rootScope.contact_user_list[i].user_id==data.user_id) {
                   is_exist = true;
                }
           }

           if(is_exist==false){

                                $rootScope.contact_user_list.push(data.profile);
                log($rootScope.contact_user_list);
            }



                 })


      $rootScope.$on('mark_watching_profile',function(event, data){
            log(data);
            $scope.watch_profile['user_'+data.user_id] = true;
      })

      $rootScope.$on('set_me_offline',function(event, data){

                       delete $scope.watch_profile['user_'+data.message.uid];

           for(key in $rootScope.contact_user_list){

                                if ($rootScope.contact_user_list[key].user_id == data.message.uid) {
                    $rootScope.contact_user_list[key].is_online = 1;
                }

                          }

      })



      $rootScope.$on('set_me_offline',function(event, data){

                      $rootScope.online['user_'+data.message.uid] = false;

                 })



      $scope.delete = function(contact_id){
          Contact.delContact(contact_id,function(rezult){
           for (var i = 0; i < $rootScope.contact_user_list.length; i++) {
                if($rootScope.contact_user_list[i].user_id==contact_id) {
                   $rootScope.contact_user_list.splice(i,1);  
                }
           }
            $rootScope.$broadcast('update_users_online');
            })

                   }


      $scope.update = function(){
        Contact.getContactList(function(rezult){
                $scope.contact_user_list = rezult.user_list;
            })       
      }



           $scope.deleteAll = function(){
          Contact.deleteAll(function(rezult){
            $rootScope.contact_user_list = []
            $rootScope.$broadcast('update_users_online');
            })
        }


        $scope.invite_window = function(contact_id){

           Room.getUserInfo(contact_id,function(result){ 
            $scope.invited_user = result.user_profile
            $scope.hide_invite_button['user_'+contact_id] = true;
         });

            $.magnificPopup.open({
              items: {
                src: '#invite_window'
              },
              type: 'inline'
            }, 0);


        }



        $scope.submit_invitation = function(){

           var message = $(document).find('#inv_text').html();
          Contact.sendInvitation($rootScope.currentUserId, $scope.invited_user.user_id, message, function(result) {
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
            $rootScope.current_opponent_id = contact_id;
            Room.invite(contact_id,function(result){

                               if(result.video_charging == true && result.opponent.gender == 'w' && !$rootScope.i_am_watching) {
                    $rootScope.$broadcast('show_opponent_video',{})
                }

            }); 
        }



         })

;

app.controller('VideoCtrl', function ($scope, $rootScope, $window, $log, Video,$interval, WS, Room) {


         $rootScope.active_cams = {}

      $scope.isMyVideoActive = false;


      $scope.onlyMicOn = function(){


                     var par = { flashvars:"vStream=false&codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://"+local_config.rtmp_server+"/myapp&micOn=true&type=out" };
            swfobject.embedSWF("Media/chat.swf?v=2", "myVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
            $scope.only_mic_on = true;
            $('.video_online').removeClass('hide_chat_window');

                        Video.onlyMicOn(function(result){

                            });
        }


      $scope.onlyMicOff = function(){

            $(document).find('#myVideoContainer').html('<div id="myVideo"></div>');
            $scope.only_mic_on = false;
            $('.video_online').addClass('hide_chat_window');
            Video.onlyMicOff(function(result){
            });

                    }



      $scope.showMyFlash = function(){


            var par = { flashvars:"vStream=false&codecOn=true&ww=800&hh=600&fps=20&streamName=eeyy"+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://"+local_config.rtmp_server+"/myapp&micOn=true&type=out" };
            swfobject.embedSWF("Media/chat_without_cam.swf?v=1", "myVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);

                     $('.video_online').removeClass('hide_chat_window');

                    }



      $scope.showMyVideo = function(){


                                                         var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://"+local_config.rtmp_server+"/myapp&micOn=true&type=out" };
            swfobject.embedSWF("Media/chat_with_cam.swf", "myVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
            $scope.isMyVideoActive = true;


                        Video.showMyCam(function(){

                            });
            if($rootScope.gender == 'w') $('.video_online').removeClass('hide_chat_window');

                    }


        $scope.hideMyVideo = function(){

            delete $rootScope.men_watching['user_'+$rootScope.current_opponent_id];
            delete $rootScope.women_watching['user_'+$rootScope.current_opponent_id];
            $(document).find('#myVideoContainer').html('<div id="myVideo"></div>');
            $scope.isMyVideoActive = false;

            Video.hideMyCam(function(){

                            })

        }


      $scope.turnMicOn = function(){
         document["myVideo"].JsTurnMicOn();
         log(document["myVideo"]);
         $scope.is_mic_on = true;
         Video.turnMicOn(function(result){

                     })
      }


      $scope.turnMicOff = function(){

        document["myVideo"].JsTurnMicOff();
        $scope.is_mic_on = false;
         Video.turnMicOff(function(result){

                     })
      }


      $scope.turnOpponentMicOn = function(){

                  $rootScope.opponent_mic_on = true;
         Video.turnOpponentMicOn(function(result){

                     })
      }

      $scope.turnOpponentMicOff = function(){

                  $rootScope.opponent_mic_on = false;
         Video.turnOpponentMicOff(function(result){

                     })
      }




      $scope.alertMicOn = function(){

         $scope.alert_mic_on = true;
         Video.alertMicOn(function(result){
         });
      }


      $scope.alertMicOff = function(){
        $scope.alert_mic_on = false;
         $scope.turnMicOff();
         Video.alertMicOff(function(result){

                     });
      }



      $scope.showOpponentVideo = function(){
                $rootScope.i_am_watching = true;

                                var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.current_opponent_id+"&url=rtmp://"+local_config.rtmp_server+"/myapp&micOn=true&type=in" }; 

                                if(  $(document).find('#oponent_video_container').is(":visible") == false )
                {
                    $(document).find('#oponent_video_container').show();
                }


                                if($rootScope.gender=='m') { 

                    Room.getBalance().then( function(result){

                        if(result.data.status==1){

                            $rootScope.emptyAccountAlert();

                                                    } else {

                             swfobject.embedSWF("Media/chat.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                             $rootScope.isOpponentCamEnabled = true;

                        }
                    })                

                } else { 

                        $rootScope.isOpponentCamEnabled = true;
                        swfobject.embedSWF("Media/chat.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                }

                                Video.showOpponentCam($rootScope.current_opponent_id,function(result){});

                               if($rootScope.gender=='m') $('.video_online').removeClass('hide_chat_window');

                                    }




                             $scope.unhideOpponentVideo = function(){
        $(document).find('#oponent_video_container').show();
      }  


      $scope.hideOpponentVideo = function(){
            $rootScope.i_am_watching = false
            $(document).find('#oponent_video_container').hide();
            $rootScope.isOpponentCamEnabled = false;
            $rootScope.alert_mic_on = false;

                        if($rootScope.gender == 'm') $('.video_online').addClass('hide_chat_window'); 

                    Video.hideOpponentCam($rootScope.current_opponent_id, function(){
                if (angular.isDefined($scope.invite_promise)) {
                    $interval.cancel($scope.invite_promise);
                    $scope.invite_promise = undefined;
                }                
                location.reload(); 
            })     


                    }








           $scope.showOpponentOnlyMic = function(){


                                var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.current_opponent_id+"&url=rtmp://"+local_config.rtmp_server+"/myapp&micOn=true&type=in" }; 


                                if($rootScope.gender=='m') { 

                    Room.getBalance().then( function(result){

                        if(result.data.status==1){

                            $rootScope.emptyAccountAlert();

                                                    } else {

                             swfobject.embedSWF("Media/chat.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                             Video.showOpponentOnlyMic($rootScope.current_opponent_id, function(){})     

                        }
                    })                

                } else { 

                        swfobject.embedSWF("Media/chat_without_cam.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                        document["myVideo"].JsTurnMicOn();
                }
                $scope.opponent_only_mic_on = true;
                $('.video_online').removeClass('hide_chat_window');

                                    }



      $scope.hideOpponentOnlyMic = function(){

                   swfobject.removeSWF("opponentVideo");
            $(document).find('#oponent_video_container').append('<div id="opponentVideo"></div>');
            $scope.opponent_only_mic_on = false;
            $('.video_online').addClass('hide_chat_window');     

             Video.hideOpponentOnlyMic($rootScope.current_opponent_id, function(){});     


                    }



    $rootScope.$on('close_video',function(event,data){

        $scope.hideOpponentVideo();
        $rootScope.emptyAccountAlert();
    })


    $rootScope.$on('show_my_video',function(event,data){
        $scope.showMyVideo();
    })

    $rootScope.$on('show_my_flash',function(event,data){
        $scope.showMyFlash();
    })


    $rootScope.$on('show_opponent_video',function(event,data){
        $scope.showOpponentVideo();
    })

    $rootScope.$on('hide_opponent_video',function(event,data){

        $scope.hideOpponentVideo();
    })


    $rootScope.$on('turn_opponent_mic_on',function(event,data){
        $scope.turnMicOn();
    })

    $rootScope.$on('turn_opponent_mic_off',function(event,data){
       $scope.turnMicOff();
    })

    $scope.$on('alert_mic_on',function(event,data){
        $scope.alert_mic_on = true;
    })

    $rootScope.$on('alert_mic_off',function(event,data){
       $scope.alert_mic_on = false;
       $scope.opponent_mic_on = false;
    })

    $scope.$on('only_mic_on',function(event,data){
       $scope.only_mic_on = true;
    })

    $rootScope.$on('only_mic_off',function(event,data){
       $scope.only_mic_on = false;
       $scope.opponent_only_mic_on = false;
       $scope.hideOpponentOnlyMic();

           })

    $scope.$on('opponent_mic_on',function(event,data){
       $scope.turnMicOn(); 
    })

    $rootScope.$on('opponent_mic_off',function(event,data){
       $scope.turnMicOff();
    })


    $rootScope.$on('update_cam_indicators',function(event,data){

        if(data.cam_status=='on') {
          $rootScope.active_cams['user_'+data.owner] = true;
        }   else {
          $rootScope.active_cams['user_'+data.owner] = false;
        }

                log($rootScope.active_cams);
        if (!event.defaultPrevented && typeof $rootScope.room_participants !== 'undefined') {
            event.defaultPrevented = true;
            for (var i = 0; i < $rootScope.room_participants.length; i++) {
                var val = $rootScope.room_participants[i];
                var arr = val.split('_');
                log(arr);
                if(arr[1]==data.owner && data.owner!= $rootScope.currentUserId){
                    log(data);
                    if(data.cam_status=='on') { 
                        $rootScope.isOpponentVideoActive = true;
                    } else {
                        swfobject.removeSWF("opponentVideo");
                        $(document).find('#oponent_video_container').append('<div id="opponentVideo"></div>');
                        $rootScope.isOpponentVideoActive = false;
                        if($rootScope.gender=='m')
                        $('.video_online').addClass('hide_chat_window');     

                    }

                                        $rootScope.isOpponentCamEnabled = false;
                    $rootScope.opponent_id = data.owner;

                                      } 


                                                    }


                    }


           });




              })




;

app.controller('multiInviteCtrl', function ($scope, $rootScope, $window, $log, Video, Online, Block, $interval, $http, Room, Contact, Auth, Status, $timeout) {




      $rootScope.notifies = {}; 
      $scope.towho = 'online';


        $scope.busy = function(opponent_id,notify_id){
            Status.sayBusy(opponent_id, function(result){
                delete $rootScope.notifies[notify_id];
            })

                   }

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



                                           }

         $scope.block = function(user_id,id){
            Block.blockUser(user_id,function(result){
                $scope.is_blocked = true;
            })
        }


         $scope.unblock = function(user_id,id){
            Block.unblockUser(user_id,function(result){
                $scope.is_blocked = false;
            })
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


        })


        $rootScope.$on('show_multi_invite_notification',function(event,data){

                        if(typeof $rootScope.chat_invitation == 'undefined' || $rootScope.chat_invitation == false)
            {
                $rootScope.notifies[data.data.id] = data.data;
                $timeout(function(){ delete $rootScope.notifies[data.data.id] }, 8000);
            }

        })








                })

;

(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .config(config);


  function config($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise("/");


        $stateProvider
            .state('anonimous', {

                url: "/",
                controller: function(){

                                    }

                            })

                        .state('registered', {

                url: "/:user",
                controller: function(){

                                }

                            })          

            .state('active', {

                url: "/:user/:opponent",

                controller: function($stateParams, Room, $rootScope, $log){

                                            $rootScope.current_opponent_id = $stateParams.opponent;

                                                $rootScope.$on('connected', function (event, data) {

                                                      Room.invite($stateParams.opponent,function(result){

                                                                if(result.video_charging == true && result.opponent.gender == 'w') {
                                    $rootScope.$broadcast('show_opponent_video',{})
                                }


                                                     setTimeout(function(){
                                    }, 2000);

                            })

                                                   });





                                                                                   }

                            })  

            .state('active_mcam', {

                url: "/:user/:opponent/mcam",

                controller: function($stateParams, Room, $rootScope, $log, $interval){


                                               $rootScope.$on('connected', function (event, data) {

                                                        Room.invite($stateParams.opponent,function(rezult){})
                        });


                                                                         $rootScope.currentUserId = $stateParams['user'];
                         setTimeout(function(){
                            $rootScope.$broadcast('show_my_video',{});
                            }, 2000);




                                                                                                        }

                            })  




                        .state('active_ocam', {

                url: "/:user/:opponent/ocam",

                controller: function($stateParams, Room, $rootScope, $log){

                                     $rootScope.$on('connected', function (event, data) {

                                                        Room.invite($stateParams.opponent,function(rezult){

                                                            })
                        });


                                                                       $rootScope.current_opponent_id = $stateParams['opponent'];
                         setTimeout(function(){
                            }, 2000);


                                     }

                            }) 





      }

})();

;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Auth', Auth);

  Auth.$inject = ['$http', '$window', '$rootScope'];

  function Auth($http, $window, $rootScope) {

    var Auth = {
      login: login,
      logout: logout,
      register: register,
      isauth: isauth,
      getFavorites: getFavorites,
      initialization: initialization
    };

        return Auth;


    function login(username, password) {
      return $http.post('/api/login/', {
        username: username, password: password
      });

     }



    function logout(callback) {
      return $http.post('/api/logout/').success(callback); 
    }

    function isauth(callback) {
      var url = utils.prepare_url(local_config.outapi.is_auth,{})
      return $http.get(url).success(callback); 
    }


    function initialization(opponent_id,callback) {
      var url = utils.prepare_url(apiconf.api.initialization.url,{'[contact_id]':opponent_id, '[user_id]':$rootScope.currentUserId, '[app_name]': local_config.app_name})
      return $http.get(url).success(callback); 
    }


    function getFavorites(callback) {
      var url = utils.prepare_url(apiconf.api.get_favorites.url,{'[user_id]':$rootScope.currentUserId, '[app_name]': local_config.app_name})
      return $http.get(url).success(callback); 
    }



    function register(username, password, email) {
        return $http.post('/api/register/', {
        username: username, password: password, email: email
      });
    }





       }



})();
;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Online', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        setOnline: setOnline,
                        setOffline: setOffline,
                        addToOnline: addToOnline,
                        removeFromOnline: removeFromOnline,
                        getOnline: getOnline,
                        getOnlineIds: getOnlineIds,
                        getOnlineExceptContact: getOnlineExceptContact,
                        sendMessage: sendMessage               
                    }

            function addToOnline(profile) {

                             } ;

            function removeFromOnline(user_id) {
                 alert('remove '+ user_id);
                 log($rootScope.online_user_list);
                    for (var i = 0; i < $rootScope.online_user_list.length; i++) {
                        if(user_id == $rootScope.online_user_list[i].user_id) {
                            $rootScope.online_user_list.splice(i,1);  
                        }
                        log($rootScope.online_user_list[i].user_id);
                    }                  
            } ;


            function setOnline() {

                             } ;

            function setOffline() {

            } ;

            function getOnlineExceptContact(callback) {

                             var url = utils.prepare_url(apiconf.api.get_online_except_contact.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };


            function getOnline(callback) {

                             var url = utils.prepare_url(apiconf.api.get_online.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };

            function getOnlineIds(callback) {

                             var url = utils.prepare_url(apiconf.api.get_online_ids.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };




            function sendMessage(owner_id,contact_id,message,callback) {
                             var url = utils.prepare_url(apiconf.api.send_message.url,{});
                             var data = {'app_name':local_config.app_name, 'owner_id':$rootScope.currentUserId,'contact_id':contact_id,  'message': message}
                             return $http.post(url,data).success(callback);
            };



    }]);


})();
;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Video', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        showMyCam: showMyCam,
                        hideMyCam: hideMyCam,
                        showOpponentCam: showOpponentCam, 
                        hideOpponentCam: hideOpponentCam,
                        hideOpponentOnlyMic: hideOpponentOnlyMic,
                        showOpponentOnlyMic: showOpponentOnlyMic,
                        turnMicOn: turnMicOn,
                        turnMicOff: turnMicOff,    
                        alertMicOn: alertMicOn,
                        alertMicOff: alertMicOff,
                        onlyMicOn: onlyMicOn,
                        onlyMicOff: onlyMicOff,
                        turnOpponentMicOn: turnOpponentMicOn,
                        turnOpponentMicOff: turnOpponentMicOff     
                    }

            function showOpponentOnlyMic(opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.show_opponent_only_mic.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function hideOpponentOnlyMic(opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.hide_opponent_only_mic.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            function turnOpponentMicOn(callback) {
                var url = utils.prepare_url(apiconf.api.opponent_mic_on.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':$rootScope.current_opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function turnOpponentMicOff(callback) {
                var url = utils.prepare_url(apiconf.api.opponent_mic_off.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':$rootScope.current_opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;



            function alertMicOn(callback) {
                var url = utils.prepare_url(apiconf.api.alert_mic_on.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':$rootScope.current_opponent_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function alertMicOff(callback) {
                var url = utils.prepare_url(apiconf.api.alert_mic_off.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':$rootScope.current_opponent_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function onlyMicOn(callback) {
                var url = utils.prepare_url(apiconf.api.only_mic_on.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':$rootScope.current_opponent_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function onlyMicOff(callback) {
                var url = utils.prepare_url(apiconf.api.only_mic_off.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':$rootScope.current_opponent_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            function hideOpponentCam(opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.hide_opponent_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function showOpponentCam(opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.show_opponent_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function hideMyCam(callback) {
                var url = utils.prepare_url(apiconf.api.hide_my_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback); 
            } ;

            function showMyCam(callback) {

                             var url = utils.prepare_url(apiconf.api.show_my_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback); 

            };



            function turnMicOn(callback) {

                             var url = utils.prepare_url(apiconf.api.turn_mic_on.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };

            function turnMicOff(callback) {

                             var url = utils.prepare_url(apiconf.api.turn_mic_off.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };



    }]);


})();
;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Block', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        blockUser: blockUser,
                        unblockUser: unblockUser,
                        checkBlockUser: checkBlockUser
                    }

            function blockUser(block_id,callback) {
                var url = utils.prepare_url(apiconf.api.block_user.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[block_id]':block_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            function unblockUser(block_id,callback) {
                var url = utils.prepare_url(apiconf.api.unblock_user.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[block_id]':block_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            function checkBlockUser(block_id,callback) {
                var url = utils.prepare_url(apiconf.api.check_block_user.url,{
                                                                                '[user_id]':block_id,
                                                                                '[block_id]':$rootScope.currentUserId,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;



                }]);


})();
;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Status', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        sayBusy: sayBusy,
                        sayClose: sayClose,
                        setInvisible: setInvisible,
                        setVisible: setVisible,
                        declineInvitation: declineInvitation,
                        acceptInvitation: acceptInvitation,
                        restartServer: restartServer,
                        checkAccessibility: checkAccessibility               
                    }
            function sayBusy(opponent_id,callback) {

                var url = utils.prepare_url(apiconf.api.say_busy.url,{
                                                                        '[user_id]':$rootScope.currentUserId,
                                                                        '[opponent_id]':opponent_id
                                                                     });
                return $http.get(url).success(callback); 


                             } ;

            function restartServer(callback) {


                var url = utils.prepare_url(apiconf.api.restart_websocket.url);
                return $http.get(url).success(callback); 





                                          } ;


            function sayClose(opponent_id,callback) {

                var url = utils.prepare_url(apiconf.api.say_close.url,{
                                                                        '[user_id]':$rootScope.currentUserId,
                                                                        '[opponent_id]':opponent_id
                                                                     });
                return $http.get(url).success(callback); 


                             } ;


            function setInvisible() {

            } ;

            function setVisible() {

            } ;


            function declineInvitation(callback) {

                             var url = utils.prepare_url(apiconf.api.decline_invitation.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback);

            };


            function acceptInvitation(callback) {

                             var url = utils.prepare_url(apiconf.api.accept_invitation.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback);

            };

            function checkAccessibility(user_id,callback) {

                             var url = utils.prepare_url(apiconf.api.check_accessebility.url,{'[user_id]':user_id});
                return $http.get(url).success(callback);

            };




    }]);


})();
;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Contact', ['$http','$rootScope', function($http,$rootScope){
            return {
                        getContactList: getContactList,
                        getContactListIds: getContactListIds,
                        delContact: delContact,
                        deleteAll: deleteAll,
                        addContact: addContact,
                        markWatchingProfile: markWatchingProfile,
                        sendInvitation: sendInvitation
                    }

            function markWatchingProfile(user_id,opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.mark_watching_profile.url,{'[user_id]':user_id, '[opponent_id]':opponent_id});
                return $http.get(url).success(callback); 

            };

            function getContactList(callback) {
                var url = utils.prepare_url(apiconf.api.get_contact_list.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };

            function getContactListIds(callback) {
                var url = utils.prepare_url(apiconf.api.get_contact_list_ids.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };

            function delContact(contact_id,callback) {
                 var url = utils.prepare_url(apiconf.api.del_contact.url,{'[owner_id]':$rootScope.currentUserId, '[contact_id]':contact_id});
                 return $http.get(url).success(callback);
            };

            function deleteAll(callback) {
                 var url = utils.prepare_url(apiconf.api.del_all_contacts.url,{'[owner_id]':$rootScope.currentUserId});
                 return $http.get(url).success(callback);
            };
            function addContact(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.add_contact.url,{'[owner_id]':$rootScope.currentUserId,'[contact_id]':contact_id});
                             return $http.get(url).success(callback);
            };



            function sendInvitation(owner_id,contact_id,message,callback) {
                             var url = utils.prepare_url(apiconf.api.send_invitation.url,{});
                             var data = {'app_name':local_config.app_name, 'owner_id':$rootScope.currentUserId,'contact_id':contact_id,  'message': message}
                             return $http.post(url,data).success(callback);
            };


    }]);


})();
;
(function () {
  'use strict';

 app.factory('GoogleTranslate', ['$http','$rootScope','$log','$q', function($http,$rootScope,$log, $q){


            return {
                        translate: translate,
                        save_translate: save_translate
                    }


        function translate(langSource, langTarget, text) {
                    var deferredObject = $q.defer();

                                        if (text.length > 0) {

                                            makeRequest(langSource,langTarget,text).then(function(result){
                               deferredObject.resolve(result.data.data.translations[0].translatedText);

                                               },function(errorMsg){
                              deferredObject.reject('Error from google translator! Request is not finished!');
                        });

                    }
                    return deferredObject.promise;
        }


        function save_translate(message,translation) {

                        var url = utils.prepare_url(apiconf.api.save_translation.url,{'[app_name]':local_config.app_name});
            var data = {"message_id": message.message.id, "translation": translation}
            $.ajax({
              type: "POST",
              url: url,
              data: data
            });
        }


            function makeRequest(langSource,langTarget, message) {
                var apiurl = "https://www.googleapis.com/language/translate/v2?key=" + local_config.google_translator_key +"&source=" + langSource + "&target=" + langTarget + "&q=";
                apiurl = apiurl + encodeURIComponent(message);
                return $http.get(apiurl);

            };

    }]);


})();

;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Room', ['$http','$rootScope', function($http,$rootScope){
            return {
                        invite: invite,
                        getUserInfo: getUserInfo,
                        getMessages: getMessages,
                        sendMessage: sendMessage,
                        showFeather: showFeather,
                        closeRoom: closeRoom,
                        getBalance: getBalance
                    }


            function closeRoom(opponent_id,callback) {
                             var url = utils.prepare_url(apiconf.api.close_chat_room.url,{
                                                                                          '[room_id]':$rootScope.room_id,
                                                                                          '[opponent_id]':opponent_id,
                                                                                          '[user_id]':$rootScope.currentUserId
                                                                                         });
                             return $http.get(url).success(callback);
                        };


            function showFeather(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.show_feather.url,{'[room_id]':$rootScope.room_id,'[opponent_id]':contact_id});
                             return $http.get(url).success(callback);
                        };


            function invite(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.invite.url,{'[owner_id]':$rootScope.currentUserId,'[contact_id]':contact_id});
                             return $http.get(url).success(callback);
                        };

            function getUserInfo(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.get_profile.url,{'[user_id]':contact_id, '[app_name]':local_config.app_name});
                             return $http.get(url).success(callback);
                        };

            function getMessages(room_id,callback) {
                            var url = utils.prepare_url(apiconf.api.get_messages.url,{'[room_id]':room_id});
                             return $http.get(url).success(callback);
                        };

            function sendMessage(room_id,message,owner_id,participants,gender,callback) {
                            var url = utils.prepare_url(apiconf.api.save_message.url);

                            var data = {'app_name':local_config.app_name,
                                    'owner_id':owner_id,
                                    'room_id':room_id,
                                    'message':message, 
                                    'participants':participants, 
                                    'gender': gender}

                            return $http.post(url, data).success(callback);
                        };


            function getBalance() {
                            var url = utils.prepare_url(apiconf.api.get_balance.url,{'[user_id]':$rootScope.currentUserId});
                             return $http.get(url);
                        };


    }]);


})();
;app.directive('chatInvitation', function() {
    var directive = {};

    directive.restrict = 'E'; 

    directive.template = '<div class="but_invite_block"><p class="show">on</p><a class="but_invite" href="#"><span></span></a><p class="">off</p></div>'

    directive.link = function($scope, element, attrs) {
            attrs.$observe('chat_invitation', function(value) {
                })

                $scope.$on('initializated', function(event, data) {


                                                        if(data.owner.user_profile.is_invitation_enabled==false){ 
                        $scope.chat_invitation = true;
                        element.find('a').addClass('off');
                    } 
                });

                element.click(function() { 

                                        element.find('a').toggleClass('off');
                    element.find('figcaption')
                    $scope.$apply(function() {
                        $scope.chat_invitation = !$scope.chat_invitation
                    })
                })

            }



    return directive;
});
;app.directive('chatTranslate', function() {
    var directive = {};

    directive.restrict = 'E'; 

    directive.replace = true;

    directive.template = '<div class="but_invite_block"><p class="show">Translator</p><a class="but_invite off" href="#"><span></span></a></div>'

    directive.link = function($scope, element, attrs) {


                element.click(function() {

                    element.find('a').toggleClass('off');

                                        log(element);
                    $scope.$apply(function() {

                                               $scope.chat_translate = !$scope.chat_translate
                    })
                })





                            }



    return directive;
});
;(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('WS', function($websocket, $rootScope, $timeout){

      var dataStream = $websocket("ws://"+local_config.ws_server+"/ws");


      dataStream.onMessage(function(message) {
        message = JSON.parse(message.data)


                if(message.action=='connected'){

                        $rootScope.$broadcast('connected');

                           }


        if(message.action=='show_new_message_notification'){
            $rootScope.$broadcast('show_new_message_notification', message.data);

        }


        if(message.action=='update_contact'){

                        $rootScope.$broadcast('update_contact');

                           }

        if(message.action=='add_me_in_contact_list'){
            $rootScope.$broadcast('add_me_in_contact_list',message);

        }

        if(message.action=='add_opponent_in_my_contact_list'){
            $rootScope.$broadcast('add_opponent_in_my_contact_list',message);

        }


        if(message.action=='put_me_in_room'){

                        $rootScope.$broadcast('put_me_in_room', message);

                           }

        if(message.action=='mark_watching_profile'){

                        $rootScope.$broadcast('mark_watching_profile', message);

                           }


        if(message.action=='show_inv_win'){

                        $rootScope.$broadcast('show_inv_win',{'message':message}); 

                          }


        if(message.action=='update_users_online'){

                        $rootScope.$broadcast('update_users_online');

                           }

        if(message.action=='set_me_online'){

            $rootScope.$broadcast('set_me_online',{'message':message});

        }




         if(message.action=='update_cam_indicators'){

                        $rootScope.$broadcast('update_cam_indicators',message);

        }

        if(message.action=='say_busy'){

                        $rootScope.$broadcast('say_busy',message);

        }



        if(message.action=='close_room'){

                        $rootScope.$broadcast('close_room',message);

        }


        if(message.action=='i_started_watching_you'){


                     $rootScope.$broadcast('i_started_watching_you',message);


                    }

        if(message.action=='update_balance'){

                       $rootScope.$broadcast('update_balance',message);

        }


        if(message.action=='i_stopted_watching_you'){

            $rootScope.$broadcast('i_stopted_watching_you',message);

        }

        if(message.action=='alert_mic_on'){

                        $rootScope.$broadcast('alert_mic_on',message);

        }

        if(message.action=='alert_mic_off'){

                       $rootScope.$broadcast('alert_mic_off',message);

        }

        if(message.action=='only_mic_on'){

                        $rootScope.$broadcast('only_mic_on',message);

        }

        if(message.action=='only_mic_off'){

                       $rootScope.$broadcast('only_mic_off',message);

        }


        if(message.action=='opponent_mic_on'){

                        $rootScope.$broadcast('opponent_mic_on',message);

        }

        if(message.action=='opponent_mic_off'){

                       $rootScope.$broadcast('opponent_mic_off',message);

        }


        if(message.action=='show_multi_invite_notification'){

            $rootScope.$broadcast('show_multi_invite_notification',message);

        }

        if(message.action=='show_feather'){

            $rootScope.$broadcast('show_feather',message);

        }


        if(message.action=='show_invite_notification'){

            $rootScope.$broadcast('show_invite_notification',message);

        }



        if(message.action=='set_me_offline'){

            $rootScope.$broadcast('set_me_offline',{'message':message});

        }


                            if(message.action=='contact_activate'){
            $rootScope.$broadcast('contact_activate',message);

        }     

                  if(message.action=='contact_deactivate'){

            $rootScope.$broadcast('contact_deactivate',message);

        }           



        if(message.action=='close_video'){

            $rootScope.$broadcast('close_video', message);

                           }



        if(message.action=='show_message'){


            $rootScope.$broadcast('show_message', {'message':  message});

                           }

        if(message.action=='put_user_to_room'){

            $rootScope.$broadcast('put_user_to_room', {'message':  message.message});

                           }


      });

      dataStream.onOpen(function(message) {

              });


      dataStream.onClose(function(message) {
                $timeout(function(){



                                        if (window.location.href.indexOf("video-chat") > 1)
                    {



                                                      window.location.reload();        

                    }


                                        }, 15000);
      });



      var methods = {

        send: function(mess) {
          mess['tpa'] = local_config.app_name
          dataStream.send(JSON.stringify(mess));
        }

      };

      return methods;   

    });


})();
;var mySound;



soundManager.setup({
  url: '/chatapp/build/swf/',
  onready: function() {
    mySound = soundManager.createSound({
      url: '/chatapp/build/alert.mp3'
    });    
  }
});





var scrH = 0;

utils = {

         parse_str: function parse_str(pars,str){

                        for (var key in pars) {
                var f = str.replace(key,pars[key]);
            }
            return f;

        },

        prepare_url: function prepare_url(str,lst){
            for (var key in lst) {
                str = str.replace(key,lst[key])
            }
            str = str.replace('[server]',local_config.signal_server)
            str = str.replace('[app_name]',local_config.app_name)
            if(str.indexOf("http://") == -1) {
                url = 'http://'+str
            } else {
                url = str
            }
            return url


        }


 }
var isOldTitle = true;
var oldTitle = document.title;
var newTitle = "***You have a new message!***";
function blinkTitle() {

       document.title = isOldTitle ? oldTitle : newTitle;
    isOldTitle = !isOldTitle;
}


function scroolldown(){

     scrH = 0;
                setTimeout(function(){
                    $(document).find('.live_write').each(function(index, el) {
                        scrH = scrH + $(this).outerHeight(true);
                    });
                    $('.ms_bar').mCustomScrollbar("scrollTo", 'bottom');
                },400);



            }




function log() {
  try {
    console.log.apply(console, arguments);                  
  }
  catch(e) {                                                
    try {
      opera.postError.apply(opera, arguments);              
    }
    catch(e){
      alert(Array.prototype.join.call( arguments, " "));    
    }
  }
}



function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}









