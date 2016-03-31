(function () {
  'use strict';

  angular
    .module('AngularChatApp')
    .run(function( $socket, $rootScope){

                $socket.on("put_me_in_room", function(event, data){
                    $rootScope.$broadcast("put_me_in_room",data);
			
                });


                $socket.on("show_message", function(event, data){
                    $rootScope.$broadcast("show_message",data);

                });


                $socket.on("ping", function(event, data){
                    $rootScope.$broadcast("ping",data);

                });


                $socket.on("show_new_message_notification", function(event, data){
                    $rootScope.$broadcast("show_new_message_notification",data);

                });


                $socket.on("update_contact", function(event, data){
                    $rootScope.$broadcast("update_contact",data);

                });


                $socket.on("add_me_in_contact_list", function(event, data){
                    $rootScope.$broadcast("add_me_in_contact_list",data);

                });


                $socket.on("add_opponent_in_my_contact_list", function(event, data){
                    $rootScope.$broadcast("add_opponent_in_my_contact_list",data);

                });


                $socket.on("mark_watching_profile", function(event, data){
                    $rootScope.$broadcast("mark_watching_profile",data);

                });

                $socket.on("show_inv_win", function(event, data){
                    $rootScope.$broadcast("show_inv_win",data);

                });

                $socket.on("update_users_online", function(event, data){
                    $rootScope.$broadcast("update_users_online",data);

                });

                $socket.on("set_me_online", function(event, data){
                    $rootScope.$broadcast("set_me_online",data);

                });

                $socket.on("update_cam_indicators", function(event, data){
                    $rootScope.$broadcast("update_cam_indicators",data);

                });

                $socket.on("say_busy", function(event, data){
                    $rootScope.$broadcast("say_busy",data);

                });

                $socket.on("close_room", function(event, data){
                    $rootScope.$broadcast("close_room",data);

                });

                $socket.on("i_started_watching_you", function(event, data){
                    $rootScope.$broadcast("i_started_watching_you",data);

                });

                $socket.on("update_balance", function(event, data){
                    $rootScope.$broadcast("update_balance",data);

                });

                $socket.on("i_stopted_watching_you", function(event, data){
                    $rootScope.$broadcast("i_stopted_watching_you",data);

                });

                $socket.on("alert_mic_on", function(event, data){
                    $rootScope.$broadcast("alert_mic_on",data);

                });

                $socket.on("alert_mic_off", function(event, data){
                    $rootScope.$broadcast("alert_mic_off",data);

                });

                $socket.on("only_mic_on", function(event, data){
                    $rootScope.$broadcast("only_mic_on",data);

                });

                $socket.on("only_mic_off", function(event, data){
                    $rootScope.$broadcast("only_mic_off",data);

                });

                $socket.on("opponent_mic_on", function(event, data){
                    $rootScope.$broadcast("opponent_mic_on",data);

                });

                $socket.on("opponent_mic_off", function(event, data){
                    $rootScope.$broadcast("opponent_mic_off",data);

                });

                $socket.on("show_multi_invite_notification", function(event, data){
                    $rootScope.$broadcast("show_multi_invite_notification",data);

                });

                $socket.on("show_feather", function(event, data){
                    $rootScope.$broadcast("show_feather",data);

                });

                $socket.on("show_invite_notification", function(event, data){
                    $rootScope.$broadcast("show_invite_notification",data);

                });


                $socket.on("set_me_offline", function(event, data){
                    $rootScope.$broadcast("set_me_offline",data);

                });


                $socket.on("contact_activate", function(event, data){
                    $rootScope.$broadcast("contact_activate",data);

                });


                $socket.on("contact_deactivate", function(event, data){
                    $rootScope.$broadcast("contact_deactivate",data);

                });

                $socket.on("close_video", function(event, data){
                    $rootScope.$broadcast("close_video",data);

                });

                $socket.on("put_user_to_room", function(event, data){
                    $rootScope.$broadcast("put_user_to_room",data);

                });




    });


})();
