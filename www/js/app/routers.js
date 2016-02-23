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
                //templateUrl: "/static/templates/active.html",
                controller: function(){
                    
                }
                
            })
            
            .state('registered', {

                url: "/:user",
                //templateUrl: "/static/templates/active.html",
                controller: function(){
                
                }
                
            })          

            .state('active', {

                url: "/:user/:opponent",
                //templateUrl: "/static/templates/active.html",

                controller: function($stateParams, Room, $rootScope, $log){
                     
                       $rootScope.current_opponent_id = $stateParams.opponent;
                        
                        $rootScope.$on('connected', function (event, data) {
                           
                           Room.invite($stateParams.opponent,function(result){
                                
                                if(result.video_charging == true && result.opponent.gender == 'w') {
                                    $rootScope.$broadcast('show_opponent_video',{})
                                }

                    
                                 setTimeout(function(){
                                     //$rootScope.$broadcast('show_my_flash',{});
                                    }, 2000);

                            })
                           
                        });
                        
                      

                     

                }
                
            })  

            .state('active_mcam', {

                url: "/:user/:opponent/mcam",
                //templateUrl: "/static/templates/active.html",

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
                //templateUrl: "/static/templates/active.html",

                controller: function($stateParams, Room, $rootScope, $log){
             
                        $rootScope.$on('connected', function (event, data) {
                            
                            Room.invite($stateParams.opponent,function(rezult){
                                
                            })
                        });
                        
                      
                         $rootScope.current_opponent_id = $stateParams['opponent'];
                         setTimeout(function(){
                            //$rootScope.$broadcast('show_opponent_video',{});
                            }, 2000);
                     

                }
                
            }) 




    
  }

})();

