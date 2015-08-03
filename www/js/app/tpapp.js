/**
 * Represents a book.
 * @constructor
 */

    var app = angular.module('AngularChatApp', [
        'ngCookies',
        'ngWebSocket' 
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
})

.factory('API', ['$http', function($http){
            return {
                        login: test
                           
                    }
            function test() {
                 
            } ;

           
    }])

 .controller('AuthCtrl', function ($window, $rootScope, $scope, API, $http) {
      $scope.login = function(user_id){
        var url = utils.prepare_url(apiconf.api.login.url,{'[user_id]': user_id});
        $http.get(url).then(function(res){
                var url = "http://" + $window.location.host + "#/" + res.data.user_id;  
                $window.location.href = url;
                console.log(res.data);
            });
      }
    
       /**
        *   
       **/
        

       $scope.tpalogin = function(user_id){
        var url = utils.prepare_url(apiconf.api.tpa_login.url,{'[user_id]': user_id});
        $http.get(url).then(function(res){
                var url = "http://brides.localhost/";  
                $window.location.href = url;
                console.log(res.data);
            });
       }
     
    })


.controller('OnlineCtrl', function ($window, $rootScope, $scope, $http, WS) {


        $scope.online = {'user_44': true};
        $scope.one = function(){
            

        }

        $scope.$on('update_users_online',function(event, data){
           
            $scope["user_online_"+1] = true;
            $scope["user_online_"+1+'_url'] = 'dddddd';
               
        })
     
    })

    .directive('userOnline', function() {
    return {
        restrict: 'E',
        scope: {
            uid: '='
        },
        template: '<p class="online">Online now</p>',
        link: function(scope, element, attrs) {
            scope.$watch('uid', function(newValue, oldValue) {
                if (newValue==true){
                    element.find('p').text('Online').addClass('online').removeClass('offline');
                } else {
                    element.find('p').text('Offline').addClass('offline').removeClass('online');
                }
                //if (newValue)
                    console.log("I see a data change! on"+newValue+' from '+oldValue);
            });
        }
    }
})


.run(function ($rootScope,$window,WS) {

    WS.send({ action: 'get_users_online'});

    $rootScope.$on('');

    $rootScope.on = function(){ $rootScope.online = {'user_150044' : true}; }
    $rootScope.off = function(){ $rootScope.online = {'user_150044' : false}; }

})

