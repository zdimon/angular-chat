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

.run(function ($rootScope, Auth, ChatConfig) {

            //console.log(apiconf);

          //  Auth.isauth(function(result){
         //       console.log(result);
         //       if(result.isauth==1) { $rootScope.isAuthenticated = true;  } else { $rootScope.isAuthenticated = false;}
         //   })

})

