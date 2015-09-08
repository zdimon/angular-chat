(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Video', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        showMyCam: showMyCam,
                        hideMyCam: hideMyCam,
                        showOpponentCam: showOpponentCam, 
                        hideOpponentCam: hideOpponentCam,
                        turnMicOn: turnMicOn,
                        turnMicOff: turnMicOff    
                    }

            function hideOpponentCam(opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.hide_opponent_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function showOpponentCam(opponent_id,callback) {
                var url = utils.prepare_url(apiconf.api.show_opponent_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[opponent_id]':opponent_id,
                                                                                '[room_id]':$rootScope.room_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;

            function hideMyCam(callback) {
                var url = utils.prepare_url(apiconf.api.hide_my_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback); 
            } ;

            function showMyCam(callback) {
             
                var url = utils.prepare_url(apiconf.api.show_my_cam.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback); 

            };



            function turnMicOn(callback) {
             
                var url = utils.prepare_url(apiconf.api.turn_mic_on.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };

            function turnMicOff(callback) {
             
                var url = utils.prepare_url(apiconf.api.turn_mic_off.url,{'[user_id]':$rootScope.currentUserId});
                return $http.get(url).success(callback); 

            };



    }]);


})();
