/*"""
Services
````````

The function :func:`someService` does a some function.
*/

    var app = angular.module('AngularChatApp', [
        'ui.router',
        'restangular',
        'app.controllers',
        'ngCookies',
        'ngSanitize',
        'ngWebSocket' 
    ]).config(function($interpolateProvider,$httpProvider) {
    $interpolateProvider.startSymbol('[[');
    $interpolateProvider.endSymbol(']]');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
})


.run(function ($rootScope, Auth, $window, WS, Online, Status, $stateParams) {

            // Initialization
            Auth.isauth(function(result){
                if(result.id>0) {

                        $rootScope.isAuthenticated = true;  
                        $rootScope.currentUserId = result.id;
                        $rootScope.currentUsername = result.id;
                        $rootScope.balance = result.balance;
                        $rootScope.gender = result.gender;
                        $rootScope.system_messages = {};
                        $rootScope.waiting_to_responce = {};
                        $rootScope.men_watching = {}
                        $rootScope.is_bootstrapted = false;
                        $rootScope.new_messages = {}
                        
                        $rootScope.close_system_message = function(win_id) {
                            delete $rootScope.system_messages[win_id];
                        }

                        // show popup alert to force user to top account
                        $rootScope.emptyAccountAlert = function(){
                                     $.magnificPopup.open({
                                      items: {
                                        src: '#empty_account_alert'
                                      },
                                      type: 'inline'
                                    }, 0);           
                            }


                        WS.send({ action: 'connect', user_id: $rootScope.currentUserId });
                   
                        /*
                        Auth.has_opponent(function(result){
                            if(result.status==0) {
                                var url = "http://" + local_config.chat_url + "#/" + $rootScope.currentUserId+'/'+result.contact_id;
                            } else {
                                var url = "http://" + local_config.chat_url  + "#/" + $rootScope.currentUserId;  
                            }
                            $window.location.href = url;
                            
                            
            
                        }) 
                        */

                        Auth.initialization($stateParams.opponent,function(result){
                            $rootScope.contact_user_list = result.contact.user_list;
                            $rootScope.online_user_list = result.online.user_list;
                            $rootScope.online = {};
                            for (var i = 0; i < result.online.user_list.length; i++) {
                                $rootScope.online['user_'+result.online.user_list[i].user_id] = true;
                            }  
                            
                            setTimeout(function(){
                                        $('.preloader').remove();
                            }, 2000);
                        })
                         
                       

                    } else { $rootScope.isAuthenticated = false;}

                  // watch changes of allow invitation trigger TODO
                  $rootScope.$watch('chat_invitation', function() {
                         if($rootScope.is_bootstrapted == true  ){
                            if($rootScope.chat_invitation == false || typeof $rootScope.chat_invitation == 'undefined') {
                            
                                    Status.acceptInvitation(function(result){
                                                 
                                    })
                            } else {
                                    Status.declineInvitation(function(result){
                                                 
                                    })
                            }
                           
                         }
                     
                    });

    


            })
        
                
                  

})

.directive('a', function() {
    return {
        restrict: 'E',
        link: function(scope, elem, attrs) {
            if(attrs.ngClick || attrs.href === '' || attrs.href === '#'){
                elem.on('click', function(e){
                    e.preventDefault();
                    
                });
            }
        }
   };
});

