(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Online', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        setOnline: setOnline,
                        setOffline: setOffline,
                        addToOnline: addToOnline,
                        removeFromOnline: removeFromOnline,
                        getOnline: getOnline,
                        getOnlineIds: getOnlineIds,
                        getOnlineExceptContact: getOnlineExceptContact,
                        sendMessage: sendMessage               
                    }

            function addToOnline(profile) {
                 
            } ;

            function removeFromOnline(user_id) {
                 alert('remove '+ user_id);
                 log($rootScope.online_user_list);
                    for (var i = 0; i < $rootScope.online_user_list.length; i++) {
                        if(user_id == $rootScope.online_user_list[i].user_id) {
                            $rootScope.online_user_list.splice(i,1);  
                        }
                        log($rootScope.online_user_list[i].user_id);
                    }                  
            } ;


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

            function getOnlineIds(callback) {
             
                var url = utils.prepare_url(apiconf.api.get_online_ids.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };



            /*"""
            .. function:: sendMessage()

            Send message to inbox by http request to the server.
               
            */

            function sendMessage(owner_id,contact_id,message,callback) {
                             var url = utils.prepare_url(apiconf.api.send_message.url,{});
                             var data = {'app_name':local_config.app_name, 'owner_id':$rootScope.currentUserId,'contact_id':contact_id,  'message': message}
                             return $http.post(url,data).success(callback);
            };



    }]);


})();
