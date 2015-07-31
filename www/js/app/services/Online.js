(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Online', ['$http', '$rootScope', function($http, $rootScope){
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
             
                var url = utils.prepare_url(apiconf.api.get_online.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };
    }]);


})();
