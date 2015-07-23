/**
 * Represents a book.
 * @constructor
 */

    var app = angular.module('AngularChatApp', [
        'ui.router',
        'restangular',
        'app.controllers',
        'ngCookies',
        'ngWebSocket' 
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
})

.run(function ($rootScope, Auth, Online, $window, WS) {

            Auth.isauth(function(result){
                if(result.status==0) { 

                        $rootScope.isAuthenticated = true;  
                        $rootScope.currentUserId = result.user_id; 
                        $rootScope.currentUsername = result.user_name;
                        
                        WS.send({ action: 'connect', tpa: apiconf.config.app_name, user_id: $rootScope.currentUserId });
                       
                        Auth.has_opponent(function(result){
                            if(result.status==0) {
                                var url = "http://" + $window.location.host + "#/" + $rootScope.currentUserId+'/'+result.contact_id;
                            } else {
                                var url = "http://" + $window.location.host + "#/" + $rootScope.currentUserId;  
                            }
                            $window.location.href = url;
                            
            
                        })
                         
                       

                    } else { $rootScope.isAuthenticated = false;}
            })

})

