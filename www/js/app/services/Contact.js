(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Contact', ['$http','WS', function($http, WS){
            return {
                        getContactList: getContactList        
                    }

            function getContactList(callback) {
                var url = utils.prepare_url(apiconf.api.get_contact_list.url,{});
                return $http.get(url).success(callback); 

            };
    }]);


})();
