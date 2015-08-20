(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Room', ['$http','$rootScope', function($http,$rootScope){
            return {
                        invite: invite,
                        getUserInfo: getUserInfo,
                        getMessages: getMessages,
                        sendMessage: sendMessage,
                        showFeather: showFeather,
                        closeRoom: closeRoom,
                        getBalance, getBalance
                    }


            function closeRoom(opponent_id,callback) {
                             var url = utils.prepare_url(apiconf.api.close_chat_room.url,{'[room_id]':$rootScope.room_id,'[opponent_id]':opponent_id});
                             return $http.get(url).success(callback);
                        };


            function showFeather(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.show_feather.url,{'[room_id]':$rootScope.room_id,'[opponent_id]':contact_id});
                             return $http.get(url).success(callback);
                        };


            function invite(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.invite.url,{'[owner_id]':$rootScope.currentUserId,'[contact_id]':contact_id});
                             return $http.get(url).success(callback);
                        };

            function getUserInfo(contact_id,callback) {
                             var url = utils.prepare_url(apiconf.api.get_profile.url,{'[user_id]':contact_id, '[app_name]':local_config.app_name});
                             return $http.get(url).success(callback);
                        };

            function getMessages(room_id,callback) {
                            var url = utils.prepare_url(apiconf.api.get_messages.url,{'[room_id]':room_id});
                             return $http.get(url).success(callback);
                        };

            function sendMessage(room_id,message,owner_id,participants,gender,callback) {
                            var url = utils.prepare_url(apiconf.api.save_message.url);

                            var data = {'app_name':local_config.app_name,
                                    'owner_id':owner_id,
                                    'room_id':room_id,
                                    'message':message, 
                                    'participants':participants, 
                                    'gender': gender}

                            return $http.post(url, data).success(callback);
                        };


            function getBalance() {
                            var url = utils.prepare_url(apiconf.api.get_balance.url,{'[user_id]':$rootScope.currentUserId});
                             return $http.get(url);
                        };


    }]);


})();
