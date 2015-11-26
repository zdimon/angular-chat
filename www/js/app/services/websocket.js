(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .factory('WS', function($websocket, $rootScope, $timeout){

      var dataStream = $websocket("ws://"+local_config.ws_server+"/ws");


      dataStream.onMessage(function(message) {
        message = JSON.parse(message.data)
        

        if(message.action=='connected'){
            
            $rootScope.$broadcast('connected');
                   
        }


        if(message.action=='show_new_message_notification'){
            $rootScope.$broadcast('show_new_message_notification', message.data);

        }


        if(message.action=='update_contact'){
            
            $rootScope.$broadcast('update_contact');
                   
        }

        if(message.action=='add_me_in_contact_list'){
            $rootScope.$broadcast('add_me_in_contact_list',message);

        }

        if(message.action=='add_opponent_in_my_contact_list'){
            $rootScope.$broadcast('add_opponent_in_my_contact_list',message);

        }


        if(message.action=='put_me_in_room'){
            
            $rootScope.$broadcast('put_me_in_room', message);
                   
        }

        if(message.action=='mark_watching_profile'){
            
            $rootScope.$broadcast('mark_watching_profile', message);
                   
        }


        if(message.action=='show_inv_win'){
            
            $rootScope.$broadcast('show_inv_win',{'message':message}); 
                  
        }


        if(message.action=='update_users_online'){
            
            $rootScope.$broadcast('update_users_online');
                   
        }

        if(message.action=='set_me_online'){

            $rootScope.$broadcast('set_me_online',{'message':message});

        }

 


        if(message.action=='update_cam_indicators'){
            
            $rootScope.$broadcast('update_cam_indicators',message);

        }

        if(message.action=='say_busy'){
            
            $rootScope.$broadcast('say_busy',message);

        }



        if(message.action=='close_room'){
            
            $rootScope.$broadcast('close_room',message);

        }


        if(message.action=='i_started_watching_you'){

         
            $rootScope.$broadcast('i_started_watching_you',message);
            

        }

        if(message.action=='update_balance'){
           
            $rootScope.$broadcast('update_balance',message);

        }


        if(message.action=='i_stopted_watching_you'){

            $rootScope.$broadcast('i_stopted_watching_you',message);

        }

        if(message.action=='alert_mic_on'){
            
            $rootScope.$broadcast('alert_mic_on',message);

        }

        if(message.action=='alert_mic_off'){
           
            $rootScope.$broadcast('alert_mic_off',message);

        }

        if(message.action=='only_mic_on'){
            
            $rootScope.$broadcast('only_mic_on',message);

        }

        if(message.action=='only_mic_off'){
           
            $rootScope.$broadcast('only_mic_off',message);

        }


        if(message.action=='opponent_mic_on'){
            
            $rootScope.$broadcast('opponent_mic_on',message);

        }

        if(message.action=='opponent_mic_off'){
           
            $rootScope.$broadcast('opponent_mic_off',message);

        }


        if(message.action=='show_multi_invite_notification'){

            $rootScope.$broadcast('show_multi_invite_notification',message);

        }

        if(message.action=='show_feather'){

            $rootScope.$broadcast('show_feather',message);

        }


        if(message.action=='show_invite_notification'){

            $rootScope.$broadcast('show_invite_notification',message);

        }



        if(message.action=='set_me_offline'){

            $rootScope.$broadcast('set_me_offline',{'message':message});

        }
          
          
        if(message.action=='contact_activate'){
            $rootScope.$broadcast('contact_activate',message);

        }     
          
        if(message.action=='contact_deactivate'){

            $rootScope.$broadcast('contact_deactivate',message);

        }           



        if(message.action=='close_video'){

            $rootScope.$broadcast('close_video', message);
                   
        }



        if(message.action=='show_message'){


            $rootScope.$broadcast('show_message', {'message':  message});
                   
        }
        
        /**
        * Request after sending invitation or accepting invitation
        *
        */
        if(message.action=='put_user_to_room'){

            $rootScope.$broadcast('put_user_to_room', {'message':  message.message});
                   
        }


      });

      dataStream.onOpen(function(message) {
        
      });


      dataStream.onClose(function(message) {
                $timeout(function(){
                    // reconnect
                    dataStream = $websocket("ws://"+local_config.ws_server+"/ws");
                    dataStream.send(JSON.stringify({ action: 'connect', user_id: $rootScope.currentUserId, source: 'chat_side', tpa: local_config.app_name}));
                }, 5000);
      });



      var methods = {

        send: function(mess) {
          // add tpa_name to each message
          mess['tpa'] = local_config.app_name
          dataStream.send(JSON.stringify(mess));
        }

      };

      return methods;   

    });


})();
