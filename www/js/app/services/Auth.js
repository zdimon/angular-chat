(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('Auth', Auth);

  Auth.$inject = ['$http', '$window', '$rootScope'];

  function Auth($http, $window, $rootScope) {

    var Auth = {
      login: login,
      logout: logout,
      register: register,
      isauth: isauth,
      getFavorites: getFavorites,
      initialization: initialization
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
      var url = utils.prepare_url(local_config.outapi.is_auth,{})
      return $http.get(url).success(callback); 
    }


    function initialization(callback) {
      var url = utils.prepare_url(apiconf.api.initialization.url,{'[user_id]':$rootScope.currentUserId, '[app_name]': local_config.app_name})
      return $http.get(url).success(callback); 
    }


    function getFavorites(callback) {
      var url = utils.prepare_url(apiconf.api.get_favorites.url,{'[user_id]':$rootScope.currentUserId, '[app_name]': local_config.app_name})
      return $http.get(url).success(callback); 
    }



    function register(username, password, email) {
        return $http.post('/api/register/', {
        username: username, password: password, email: email
      });
    }


  

   
  }



})();
