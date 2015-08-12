(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Online', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        setOnline: setOnline,
                        setOffline: setOffline,
                        getOnline: getOnline,
                        getOnlineExceptContact: getOnlineExceptContact               
                    }
            function setOnline() {
                 
            } ;

            function setOffline() {

            } ;

            function getOnlineExceptContact(callback) {
             
                var url = utils.prepare_url(apiconf.api.get_online_except_contact.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };


            function getOnline(callback) {
             
                var url = utils.prepare_url(apiconf.api.get_online.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };


    }]);


})();
