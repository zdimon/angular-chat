(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .config(config);

  function config($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise("/");


        $stateProvider
            .state('index', {

                url: "/",
                templateUrl: "/templates/index.html",
                
            })
            
            


    
  }

})();

