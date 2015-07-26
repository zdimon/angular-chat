(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('WS', function($websocket, $rootScope, Online){

      var dataStream = $websocket("ws://"+apiconf.config.ws_server+"/ws");


      dataStream.onMessage(function(message) {
        message = JSON.parse(message.data)
        console.log(message);


        if(message.action=='update_users_online'){
            
            $rootScope.$broadcast('update_users_online');
                   
        }

        if(message.action=='send_message'){

            $rootScope.$broadcast('send_message', {'message':  message.message});
                   
        }

      });

      dataStream.onOpen(function(message) {
        
      });


      var methods = {

        send: function(mess) {
          dataStream.send(JSON.stringify(mess));
        }

      };

      return methods;   

    });


})();
