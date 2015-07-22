(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Online', ['$http','WS', function($http, WS){
            return {
                        setOnline: setOnline,
                        setOffline: setOffline,
                        getOnline: getOnline        
                    }
            function setOnline() {
                 
            } ;

            function setOffline() {

            } ;

            function getOnline(callback) {
                WS.send({ action: 'set_online' });
                var url = utils.prepare_url(apiconf.api.get_online.url);
                return $http.get(url).success(callback); 

            };
    }]);


})();
