(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('WSocket', function ($scope, $q) {
        //var sockjs = new SockJS('http://chat.localhost:8888/ws');
        //var defer = $q.defer();

        
            $scope.connect = function () {

                var transports = ['websocket', 'xhr-streaming' ,'iframe-eventsource', 'iframe-htmlfile' , 'xhr-polling', 'iframe-xhr-polling', 'jsonp-polling'];



                var defer = $q.defer();
                var ws = new SockJS('http://localhost:8888/ws', transports);
                
                ws.onopen = function (evt) {
                    defer.resolve("socket connected");
                    $scope.ws = ws
                    $scope.$apply();
                }
                return defer.promise;
            }

                $scope.connect().then(function(data){
                mess = {"action" : "connect"};
                $scope.ws.send(JSON.stringify(mess));
                })
        
        
    });

})();
