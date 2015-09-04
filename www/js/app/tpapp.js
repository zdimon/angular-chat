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
                console.log(res.data);
                var url = "http://" + $window.location.host + "/video-chat#/" + res.data.id + "/"+ opponent_id;
                $window.location.href = url;

            });
      }



    })


        .controller('NotifyCtrl', function ($window, $rootScope, $scope, API, $http) {

            $rootScope.notifies = {};
            $rootScope.$on('show_new_message_notification',function(event,data){

                $rootScope.notifies[data.id] = data;
            });

            $scope.goToRoom = function(user_id){

                var url = "http://" + $window.location.host + "/video-chat#/"+$rootScope.currentUserId+'/'+ user_id;
                $window.location.href = url;
         
            }

            $scope.remove = function(id){
                delete $rootScope.notifies[id];
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


.controller('OnlineCtrl', function ($window, $rootScope, $scope, $http, WS) {


       
        $scope.$on('update_users_online',function(event, data){
           
            $scope["user_online_"+1] = true;
            $scope["user_online_"+1+'_url'] = 'dddddd';
               
        })
     
    })

    .controller('ActionCtrl', function ($window, $rootScope, $scope, $http) {
        
        $scope.invite = function(user_id){

                var url = "http://" + $window.location.host + "/video-chat#/"+ $rootScope.currentUserId + '/' +user_id;  
                $window.location.href = url;            
            
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


            Auth.isauth(function(result){
                if(result.id>0) {
                        $rootScope.isAuthenticated = true;
                        $rootScope.currentUserId = result.id;
                        WS.send({ action: 'connect', user_id: $rootScope.currentUserId });

                        $rootScope.online = {}

                          Online.getOnline(function(rezult){
                                for (user in rezult.user_list) {
                                    $rootScope.online['user_'+rezult.user_list[user]['user_id']] = true;
                                }       
                             }); 


                    } else { $rootScope.isAuthenticated = false;}
            })



    

    //WS.send({ action: 'get_users_online'});

    $rootScope.$on('set_me_online',function(event,data){
        $rootScope.online['user_'+data.message.uid] = true;
    });


    $rootScope.$on('update_cam_indicators',function(event,data){
        
        $rootScope.activecam = {}
        for (var i = 0; i < data.data.length; i++) {
            $rootScope.activecam['user_'+data.data[i]] = true;
        }
       
    });



    $rootScope.$on('set_me_offline',function(event,data){
        $rootScope.online['user_'+data.message.uid] = false;
    });



})

