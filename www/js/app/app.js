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
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
})


.run(function ($rootScope, Auth, $window, WS) {


            Auth.isauth(function(result){
                if(result.id>0) {

                        $rootScope.isAuthenticated = true;  
                        $rootScope.currentUserId = result.id;
                        $rootScope.currentUsername = result.id;
                        $rootScope.$broadcast('rootScope_ready');

                        WS.send({ action: 'connect', user_id: $rootScope.currentUserId });
                   
                        /*
                        Auth.has_opponent(function(result){
                            if(result.status==0) {
                                var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+result.contact_id;
                            } else {
                                var url = "http://" + local_config.chat_url  + "#/" + $rootScope.currentUserId;  
                            }
                            $window.location.href = url;
                            
                            
            
                        }) 
                        */
                         
                       

                    } else { $rootScope.isAuthenticated = false;}
            })

})

