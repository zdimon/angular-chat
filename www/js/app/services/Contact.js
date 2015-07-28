(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Contact', ['$http','$rootScope', function($http,$rootScope){
            return {
                        getContactList: getContactList,
                        delContact: delContact,
                        deleteAll: deleteAll
                    }

            function getContactList(callback) {
                var url = utils.prepare_url(apiconf.api.get_contact_list.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };

            function delContact(contact_id,callback) {
                 var url = utils.prepare_url(apiconf.api.del_contact.url,{'[owner_id]':$rootScope.currentUserId, '[contact_id]':contact_id});
                 return $http.get(url).success(callback);
            };

            function deleteAll(callback) {
                 var url = utils.prepare_url(apiconf.api.del_all_contacts.url,{'[owner_id]':$rootScope.currentUserId});
                 return $http.get(url).success(callback);
            };
    }]);


})();
