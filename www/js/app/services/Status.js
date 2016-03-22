(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Status', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        sayBusy: sayBusy,
                        sayClose: sayClose,
                        setInvisible: setInvisible,
                        setVisible: setVisible,
                        declineInvitation: declineInvitation,
                        acceptInvitation: acceptInvitation,
                        restartServer: restartServer,
                        checkAccessibility: checkAccessibility               
                    }
            function sayBusy(opponent_id,callback) {

                var url = utils.prepare_url(apiconf.api.say_busy.url,{
                                                                        '[user_id]':$rootScope.currentUserId,
                                                                        '[opponent_id]':opponent_id
                                                                     });
                return $http.get(url).success(callback); 

                 
            } ;

            function restartServer(opponent_id,callback) {


                var url = utils.prepare_url(apiconf.api.restart_websocket.url);
                return $http.get(url).success(callback); 

             


                 
            } ;


            function sayClose(opponent_id,callback) {

                var url = utils.prepare_url(apiconf.api.say_close.url,{
                                                                        '[user_id]':$rootScope.currentUserId,
                                                                        '[opponent_id]':opponent_id
                                                                     });
                return $http.get(url).success(callback); 

                 
            } ;


            function setInvisible() {

            } ;

            function setVisible() {

            } ;


            function declineInvitation(callback) {
             
                var url = utils.prepare_url(apiconf.api.decline_invitation.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback);

            };


            function acceptInvitation(callback) {
             
                var url = utils.prepare_url(apiconf.api.accept_invitation.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback);

            };

            function checkAccessibility(user_id,callback) {
             
                var url = utils.prepare_url(apiconf.api.check_accessebility.url,{'[user_id]':user_id});
                return $http.get(url).success(callback);

            };




    }]);


})();
