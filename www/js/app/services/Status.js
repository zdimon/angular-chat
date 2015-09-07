(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Status', ['$http', '$rootScope', function($http, $rootScope){
            return {
                        sayBusy: sayBusy,
                        setInvisible: setInvisible,
                        setVisible: setVisible,
                        declineInvitation: declineInvitation,
                        acceptInvitation: acceptInvitation               
                    }
            function sayBusy(opponent_id) {

                var url = utils.prepare_url(apiconf.api.say_busy.url,{
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
             


            };


            function acceptInvitation(callback) {
             


            };



    }]);


})();
