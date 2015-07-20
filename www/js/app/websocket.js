(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('WS', function($websocket){


      var dataStream = $websocket("ws://localhost:8888/ws");

      var collection = [];

      dataStream.onMessage(function(message) {
        collection.push(JSON.parse(message.data));
      });

      dataStream.onOpen(function(message) {
        dataStream.send(JSON.stringify({ action: 'get' }));
      });


      var methods = {
        collection: collection,
        get: function() {
          dataStream.send(JSON.stringify({ action: 'get' }));
        }
      };

      return methods;   
     
    

    });

  


})();
