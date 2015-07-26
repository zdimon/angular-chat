/**
 * Represents a book.
 * @constructor
 */

    var app = angular.module('TpaApp', [
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
     
    })

.run(function ($rootScope,$window) {

 

})

