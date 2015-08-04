/*"""
tpapp.js
````````
:author: Dimas zdimon77@gmail.com
    
*/ 

    var app = angular.module('AngularChatApp', [
        'ngCookies',
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

 .controller('AuthCtrl', function ($window, $rootScope, $scope, API, $http) {
      $scope.login = function(user_id){
        var url = utils.prepare_url(apiconf.api.login.url,{'[user_id]': user_id});
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
        var url = utils.prepare_url(apiconf.api.tpa_login.url,{'[user_id]': user_id});
        $http.get(url).then(function(res){
                var url = "http://brides.localhost/";  
                $window.location.href = url;
                console.log(res.data);
            });
       }
     
    })


.controller('OnlineCtrl', function ($window, $rootScope, $scope, $http, WS) {


        $scope.online = {'user_44': true};
        $scope.one = function(){
            

        }

        $scope.$on('update_users_online',function(event, data){
           
            $scope["user_online_"+1] = true;
            $scope["user_online_"+1+'_url'] = 'dddddd';
               
        })
     
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




    .directive('invitationLink', function() {

    /*"""
    .. function:: invitationLink

        Directive that generate link to chat page using user and opponent identifiers.

        Current user id kips in $rootScope but opponent id takes from attribute 'uid'. 

        :using: <x-invitation-link uid=<?php echo $user.id ?>>Chat with me!</x-invitation-link>

       
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




.run(function ($rootScope,$window,Online,$log, WS) {

    $rootScope.online = {}

      Online.getOnline(function(rezult){
            for (user in rezult.user_list) {
                $rootScope.online['user_'+rezult.user_list[user]['user_id']] = true;
            }       
         }); 
    

    //WS.send({ action: 'get_users_online'});

    $rootScope.$on('set_me_online',function(event,data){
        $rootScope.online['user_'+data.message.uid] = true;
    });

    $rootScope.$on('set_me_offline',function(event,data){
        $rootScope.online['user_'+data.message.uid] = false;
    });


    $rootScope.on = function(){ $rootScope.online = {'user_150044' : true}; }
    $rootScope.off = function(){ $rootScope.online = {'user_150044' : false}; }

})

