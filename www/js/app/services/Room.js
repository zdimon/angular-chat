(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Room', ['$http','$rootScope', function($http,$rootScope){
            return {
                        invite: invite,
                        getUserInfo: getUserInfo,
                        getMessages: getMessages
                    }

            function invite(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.invite.url,{'[owner_id]':$rootScope.currentUserId,'[contact_id]':contact_id});
                             return $http.get(url).success(callback);
                        };
            function getUserInfo(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.get_profile.url,{'[user_id]':contact_id, '[app_name]':apiconf.config.app_name});
                             return $http.get(url).success(callback);
                        };
            function getMessages(room_id,callback) {
                            var url = utils.prepare_url(apiconf.api.get_messages.url,{'[room_id]':room_id});
                             return $http.get(url).success(callback);
                        };

    }]);


})();
