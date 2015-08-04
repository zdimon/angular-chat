(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Contact', ['$http','$rootScope', function($http,$rootScope){
            return {
                        getContactList: getContactList,
                        delContact: delContact,
                        deleteAll: deleteAll,
                        addContact: addContact,
                        sendInvitation: sendInvitation
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
            function addContact(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.add_contact.url,{'[owner_id]':$rootScope.currentUserId,'[contact_id]':contact_id});
                             return $http.get(url).success(callback);
            };


            /*"""
            .. function:: sendInvitation()

            Send invitation message to men by http request to server.
               
            */

            function sendInvitation(owner_id,contact_id,message,callback) {
                             var url = utils.prepare_url(apiconf.api.send_invitation.url,{});
                             var data = {'app_name':local_config.app_name, 'owner_id':$rootScope.currentUserId,'contact_id':contact_id,  'message': message}
                             return $http.post(url,data).success(callback);
            };


    }]);


})();
