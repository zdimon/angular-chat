(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('WS', function($websocket, $rootScope){


      var dataStream = $websocket("ws://"+apiconf.config.ws_server+"/ws");

      var collection = [];

      dataStream.onMessage(function(message) {
        collection.push(JSON.parse(message.data));
      });

      dataStream.onOpen(function(message) {
        
      });


      var methods = {

        collection: collection,

        get: function() {
          dataStream.send(JSON.stringify({ action: 'get' }));
        },

        send: function(mess) {
          dataStream.send(JSON.stringify(mess));
        }




      };

      return methods;   
     
    

    });

  


})();
