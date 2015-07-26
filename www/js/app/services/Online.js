(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Online', ['$http', function($http){
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
             
                var url = utils.prepare_url(apiconf.api.get_online.url,{});
                return $http.get(url).success(callback); 

            };
    }]);


})();
