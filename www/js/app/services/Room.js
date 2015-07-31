(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Room', ['$http','$rootScope', function($http,$rootScope){
            return {
                        invite: invite,
                        getUserInfo: getUserInfo,
                        getMessages: getMessages,
                        sendMessage: sendMessage
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
            function sendMessage(room_id,message,owner_id,participants,callback) {
                            var url = utils.prepare_url(apiconf.api.save_message.url);
                             return $http.post(url,{'app_name':apiconf.config.app_name,'owner_id':owner_id,'room_id':room_id,'message':message, 'participants':participants}).success(callback);
                        };

    }]);


})();
