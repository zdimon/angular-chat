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
                templateUrl: "/static/templates/active.html",
                controller: function(){
  
                }
                
            })
            
            .state('registered', {

                url: "/:user",
                templateUrl: "/static/templates/active.html",
                controller: function(){
   
                }
                
            })          

            .state('active', {

                url: "/:user/:opponent",
                templateUrl: "/static/templates/active.html",

                controller: function($stateParams, Room, $rootScope, $log){
                
                        $rootScope.$on('connected', function (event, data) {
                            Room.invite($stateParams.opponent,function(rezult){})
                        });
                        
                      $rootScope.$on("$locationChangeStart", function(event, next, current) { 
                        $log.info("location changing to:" + next); 
                        event.preventDefault();
                      });

                      init_wisiwig();

                }
                
            })  


    
  }

})();

