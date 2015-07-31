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
        'ngWebSocket' 
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
})


.run(function ($rootScope, Auth, $window, WS) {


            Auth.isauth(function(result){
                if(result.status==0) { 

                        $rootScope.isAuthenticated = true;  
                        $rootScope.currentUserId = result.user_id; 
                        $rootScope.currentUsername = result.user_name;

                        $rootScope.$broadcast('rootScope_ready');

                        WS.send({ action: 'connect', tpa: apiconf.config.app_name, user_id: $rootScope.currentUserId });
                   
                        /*
                        Auth.has_opponent(function(result){
                            if(result.status==0) {
                                var url = "http://" + apiconf.config.chat_url + "#/" + $rootScope.currentUserId+'/'+result.contact_id;
                            } else {
                                var url = "http://" + apiconf.config.chat_url  + "#/" + $rootScope.currentUserId;  
                            }
                            $window.location.href = url;
                            
                            
            
                        }) 
                        */
                         
                       

                    } else { $rootScope.isAuthenticated = false;}
            })

})

