(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Auth', Auth);

  Auth.$inject = ['$http', '$window'];

  function Auth($http, $window) {

    var Auth = {
      login: login,
      logout: logout,
      register: register,
      isauth: isauth,
    };
    
    return Auth;
    
    

    function login(username, password) {
      return $http.post('/api/login/', {
        username: username, password: password
      });
 
    }


    function logout(callback) {
      return $http.post('/api/logout/').success(callback); 
    }

    function isauth(callback) {
      return $http.get('/api/isauth/').success(callback); 
    }



    function register(username, password, email) {
        return $http.post('/api/register/', {
        username: username, password: password, email: email
      });
    }

   
  }


  angular
    .module('AngularChatApp')
    .factory('Online', ['$http','WS', function($http, WS){
            return {
                        setOnline: setOnline,
                        setOffline: setOffline,
                        getOnline: getOnline        
                    }
            function setOnline() {
                 
            } ;

            function setOffline() {

            } ;

            function getOnline(callback) {
                WS.send({ action: 'set_online' });
                var url = utils.prepare_url(apiconf.api.get_online.url);
                return $http.get(url).success(callback); 

            };
    }]);


})();
