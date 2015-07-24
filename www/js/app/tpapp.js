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

 .controller('AuthCtrl', function ($scope) {
      $scope.login = function(){
        alert('ssssaaaaa');
      }
     
    })

.run(function ($rootScope,$window) {

 

})

