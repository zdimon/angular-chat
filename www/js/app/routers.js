/**
 * Routing
 * 
 */

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
                templateUrl: "/static/templates/anonimous.html",
                
            })
            
            .state('registered', {

                url: "/:user",
                templateUrl: "/static/templates/registered.html",
                
            })          

            .state('active', {

                url: "/:user/:opponent",
                templateUrl: "/static/templates/active.html",
                
            })  


    
  }

})();

