/*"""
tpapp.js
````````
:author: Dimas zdimon77@gmail.com
    
*/ 

    var app = angular.module('AngularChatApp', [
        'ngCookies',
        'ngSanitize',
        'ngWebSocket' 
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
})

.factory('API', ['$http', function($http){
            return {
                        login: test
                           
                    }
            function test() {
                 
            } ;

           
    }])


    .controller('TestCtrl', function ($window, $rootScope, $scope, API, $http) {

      $scope.test_login = function(user_id,opponent_id){

        var url = utils.prepare_url(local_config.outapi.login,{'[user_id]': user_id});
        $http.get(url).then(function(res){
                var url = "http://" + $window.location.host + "/video-chat#/" + res.data.id + "/"+ opponent_id;
                $window.location.href = url;

            });
      }



    })


        .controller('NotifyCtrl', function ($window, $rootScope, $scope, API, Status, $http, $timeout) {

            $rootScope.notifies = {};
            
         

            $rootScope.$on('show_new_message_notification',function(event,data){
                   
                   if(typeof $rootScope.notifies[data.id] == 'undefined') {
                    if(!$rootScope.active_contacts['user_'+data.opponent.user_id]){
                        if($rootScope.gender=='w'){ document.getElementById('audio_alert').play(); }
                        $rootScope.notifies[data.id] = data;
                        $timeout(function(){ delete $rootScope.notifies[data.id] }, 15000);
                    }
                   }
            
            });

            $rootScope.$on('show_invite_notification',function(event,data){
                
                if(typeof $rootScope.notifies[data.data.id] == 'undefined') {
                    if(!$rootScope.active_contacts['user_'+data.data.opponent.user_id]){
                        if($rootScope.gender=='w'){document.getElementById('audio_alert').play(); }
                        $rootScope.notifies[data.data.id] = data.data;
                        $timeout(function(){ delete $rootScope.notifies[data.data.id] }, 15000);
                    }
                }
            }); 

            $rootScope.$on('show_multi_invite_notification',function(event,data){
                
                if(typeof $rootScope.notifies[data.data.id] == 'undefined') {
                    if(!$rootScope.active_contacts['user_'+data.data.opponent.user_id]){
                        if($rootScope.gender=='w'){document.getElementById('audio_alert').play(); }
                       
                            $rootScope.notifies[data.data.id] = data.data;
                            $timeout(function(){ delete $rootScope.notifies[data.data.id] }, 15000);
                        
                        
                    }
                }
            });


            $rootScope.$on('contact_activate',function(event,data){
                        $rootScope.active_contacts['user_'+data.user_id] = true;
            })  

            $rootScope.$on('contact_deactivate',function(event,data){
                       delete $rootScope.active_contacts['user_'+data.user_id];
            })              


            $scope.goToRoom = function(user_id){

                var url = "http://" + $window.location.host + "/video-chat#/"+$rootScope.currentUserId+'/'+ user_id;
                $window.location.href = url;
                //$window.open(url);
         
            }

            $scope.remove = function(id){
                delete $rootScope.notifies[id];
            }

            $scope.busy = function(opponent_id,notify_id){
                Status.sayBusy(opponent_id, function(result){
                    delete $rootScope.notifies[notify_id];
                })
               
            }

            $scope.close = function(opponent_id,notify_id){
                Status.sayClose(opponent_id, function(result){
                    delete $rootScope.notifies[notify_id];
                })
               
            }



         })



 .controller('AuthCtrl', function ($window, $rootScope, $scope, API, $http) {
      $scope.login = function(user_id){
        var url = utils.prepare_url(local_config.outapi.login,{'[user_id]': user_id});
        $http.get(url).then(function(res){
                var url = "http://" + $window.location.host + "#/" + res.data.user_id;  
                $window.location.href = url;
                console.log(res.data);
            });
      }
    
       /**
        *   
       **/
        

       $scope.tpalogin = function(user_id){
        var url = utils.prepare_url(local_config.outapi.login,{'[user_id]': user_id});
        $http.get(url).then(function(res){
                var url = "http://brides.localhost/";  
                $window.location.href = url;
                console.log(res.data);
            });
       }
     
    })


.controller('OnlineCtrl', function ($window, $rootScope, $scope, $http, WS ) {


       
        $scope.$on('update_users_online',function(event, data){
           
            $scope["user_online_"+1] = true;
            $scope["user_online_"+1+'_url'] = 'dddddd';
               
        })
     
    })

    .controller('ActionCtrl', function ($window, $rootScope, $scope, $http, Status) {
        
        $scope.invite = function(user_id){
            
                Status.checkAccessibility(user_id,function(result){
                    log(result);
                    if(result.status == 1) {
                         alert(result.message)
                    } else {
                         var url = "http://" + $window.location.host + "/video-chat#/"+ $rootScope.currentUserId + '/' +user_id;  
                         $window.location.href = url;    
                    }
                
                })
        }

        $scope.inviteWithOpponentVideo = function(user_id){
                
                Status.checkAccessibility(user_id,function(result){
                    log(result);
                    if(result.status == 1) {
                         alert(result.message)
                    } else {
                         var url = "http://" + $window.location.host + "/video-chat#/"+ $rootScope.currentUserId + '/' +user_id+'/ocam';  
                         $window.location.href = url;    
                    }
                
                })
        }

        $scope.inviteWithMyVideo = function(user_id){
         
                Status.checkAccessibility(user_id,function(result){
                    log(result);
                    if(result.status == 1) {
                         alert(result.message)
                    } else {
                         var url = "http://" + $window.location.host + "/video-chat#/"+ $rootScope.currentUserId + '/' +user_id+'/mcam';  
                         $window.location.href = url;    
                    }
                
                })
            
        }
     
    })

.controller('ShowProfileCtrl', function ($window, $rootScope, $scope, $http, Contact) {
        
        $scope.init = function(user_id,opponent_id){
                
                Contact.markWatchingProfile(user_id,opponent_id,function(result){
                    log(result);
                })
        }
     
    })



    .directive('onlineIndicator', function() {

    /*"""
    .. function:: onlineIndicator

        Directive that insert online indicator into the DOM.

        :template: <p class="online">Online now</p>

        :param: directive watches uid attribute and change css class

        :using: <x-online-indicator uid="online.user_<?php echo $girl->login ?>"></x-online-indicator> 
    */     

    return {
        restrict: 'E',
        scope: {
            uid: '='
        },
        template: '<p class="online">Online now</p>',
        link: function(scope, element, attrs) {
            scope.$watch('uid', function(newValue, oldValue) {
                if (newValue==true){
                    element.find('p').text('Online').addClass('online').removeClass('offline');
                } else {
                    element.find('p').text('Offline').addClass('offline').removeClass('online');
                }

            });
        }
    }
})




    .directive('invitationLink', function($rootScope) {

    /*"""
    .. function:: invitationLink

        Directive that generate link to chat page using user and opponent identifiers.

        Current user id kips in $rootScope but opponent id takes from attribute 'uid'. 

        :using: <x-invitation-link uid=<?php echo $user.id ?>>Chat with me!</x-invitation-link>

       
    */     

    return {
        restrict: 'A',
        scope: {
            uid: '=opponent'
        },
        //template: '<p class="online">Online now</p>',
        link: function(scope, element, attrs) {
           var curhref = attrs['href'];
           attrs.$set('href',curhref+'/#/'+attrs.chatOpponent);
        }
    }
})




.run(function ($rootScope,$window,Online,$log, WS, Auth) {

            $rootScope.active_contacts = {};
            Auth.isauth(function(result){
                console.log(result);
                $rootScope.gender = result.gender;
                
                if(result.id>0) {
                        $rootScope.isAuthenticated = true;
                        $rootScope.currentUserId = result.id;
                        WS.send({ action: 'connect', user_id: $rootScope.currentUserId, source: 'tpa_side' });
                        $rootScope.online = {};
                        $rootScope.activecam = {};
                          Online.getOnline(function(rezult){
                                for (user in rezult.user_list) {
                                    $rootScope.online['user_'+rezult.user_list[user]['user_id']] = true;
                                    $rootScope.activecam['user_'+rezult.user_list[user]['user_id']] = rezult.user_list[user]['is_camera_active'];
                                }       
                             }); 


                    } else { 
                        $rootScope.isAuthenticated = false;                   
                    }
            })



    

    //WS.send({ action: 'get_users_online'});

    $rootScope.$on('set_me_online',function(event,data){
        $rootScope.online['user_'+data.message.uid] = true;
        log('set online - '+data.message.uid)
    });


    $rootScope.$on('update_cam_indicators',function(event,data){
        
        $rootScope.activecam = {}
        for (var i = 0; i < data.data.length; i++) {
            $rootScope.activecam['user_'+data.data[i]] = true;
        }
       
    });



    $rootScope.$on('set_me_offline',function(event,data){
        delete $rootScope.online['user_'+data.message.uid];
        log('set offline - '+data.message.uid)
    });



})

