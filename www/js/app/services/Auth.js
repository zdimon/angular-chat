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
      has_opponent: has_opponent,
    };
    
    return Auth;

    /*"""
    .. function:: login(username, password)

        :param string username: Login
        :param string password: Password
        :returns: Promice.
    */    

    function login(username, password) {
      return $http.post('/api/login/', {
        username: username, password: password
      });
 
    }



    function logout(callback) {
      return $http.post('/api/logout/').success(callback); 
    }

    function isauth(callback) {
      var url = utils.prepare_url(apiconf.api.is_auth.url,{})
      return $http.get(url).success(callback); 
    }



    function register(username, password, email) {
        return $http.post('/api/register/', {
        username: username, password: password, email: email
      });
    }


    function has_opponent(callback) {
      var url = utils.prepare_url(apiconf.api.has_opponent.url,{})
      return $http.get(url).success(callback); 
    }

   
  }



})();
