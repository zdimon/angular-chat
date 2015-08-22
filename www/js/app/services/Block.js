(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Block', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        blockUser: blockUser,
                        unblockUser: unblockUser,
                        checkBlockUser: checkBlockUser
                    }

            function blockUser(block_id,callback) {
                var url = utils.prepare_url(apiconf.api.block_user.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[block_id]':block_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            function unblockUser(block_id,callback) {
                var url = utils.prepare_url(apiconf.api.unblock_user.url,{
                                                                                '[user_id]':$rootScope.currentUserId,
                                                                                '[block_id]':block_id,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            function checkBlockUser(block_id,callback) {
                var url = utils.prepare_url(apiconf.api.check_block_user.url,{
                                                                                '[user_id]':block_id,
                                                                                '[block_id]':$rootScope.currentUserId,
                                                                                '[app_name]': local_config.app_name
                                                                                });
                return $http.get(url).success(callback);                  
            } ;


            
    }]);


})();
