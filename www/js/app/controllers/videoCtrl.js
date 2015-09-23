/*"""
videoCtrl.js
``````````````


Manipulate with video blocks.
 


*/

app.controller('VideoCtrl', function ($scope, $rootScope, $window, $log, Video,$interval, WS, Room) {


         $rootScope.active_cams = {}

        /*"""
        .. function:: $scope.$on('rootScope_ready'...


<param name="FlashVars" value="codecOn=true&ww=800&hh=600&fps=20&streamName={{ token }}&url=rtmp://{{ rtmp_domain }}/myapp&micOn=false&type={{ type }}" />

           
        */ 
      $scope.isMyVideoActive = false;


      $scope.onlyMicOn = function(){

            //alert('show_only_mic');         
         
            var par = { flashvars:"vStream=false&codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://chat.mirbu.com/myapp&micOn=true&type=out" };
            swfobject.embedSWF("Media/chat.swf?v=2", "myVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
            $scope.only_mic_on = true;
            $('.video_online').removeClass('hide_chat_window');
            
            Video.onlyMicOn(function(result){
                
            });
        }


      $scope.onlyMicOff = function(){

            //alert('show_only_mic_of');         
            $(document).find('#myVideoContainer').html('<div id="myVideo"></div>');
            $scope.only_mic_on = false;
            $('.video_online').addClass('hide_chat_window');
            Video.onlyMicOff(function(result){
            });
            
        }



      $scope.showMyFlash = function(){

            //alert('show_my_flash');         

            var par = { flashvars:"vStream=false&codecOn=true&ww=800&hh=600&fps=20&streamName=eeyy"+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://chat.mirbu.com/myapp&micOn=true&type=out" };
            swfobject.embedSWF("Media/chat_without_cam.swf?v=1", "myVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
         
            $('.video_online').removeClass('hide_chat_window');
            
        }



      $scope.showMyVideo = function(){
                                 

            var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://chat.mirbu.com/myapp&micOn=true&type=out" };
            swfobject.embedSWF("Media/chat_with_cam.swf", "myVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
            $scope.isMyVideoActive = true;

            
            Video.showMyCam(function(){
                
            });
            if($rootScope.gender == 'w') $('.video_online').removeClass('hide_chat_window');
            
        }

  
      $scope.hideMyVideo = function(){
            
            // mark user as is NOT watching in contact list
            delete $rootScope.men_watching['user_'+$rootScope.current_opponent_id];
            //**************************************
            $(document).find('#myVideoContainer').html('<div id="myVideo"></div>');
            //swfobject.removeSWF("myVideo");
            $scope.isMyVideoActive = false;

            Video.hideMyCam(function(){
                
            })

        }


      $scope.turnMicOn = function(){
         document["myVideo"].JsTurnMicOn();
         log(document["myVideo"]);
         $scope.is_mic_on = true;
         Video.turnMicOn(function(result){
            
         })
      }


      $scope.turnMicOff = function(){

        document["myVideo"].JsTurnMicOff();
        $scope.is_mic_on = false;
         Video.turnMicOff(function(result){
            
         })
      }


      $scope.turnOpponentMicOn = function(){
         
         $rootScope.opponent_mic_on = true;
         Video.turnOpponentMicOn(function(result){
            
         })
      }

      $scope.turnOpponentMicOff = function(){
         
         $rootScope.opponent_mic_on = false;
         Video.turnOpponentMicOff(function(result){
            
         })
      }




      $scope.alertMicOn = function(){

         $scope.alert_mic_on = true;
         Video.alertMicOn(function(result){
         });
      }


      $scope.alertMicOff = function(){
        $scope.alert_mic_on = false;
         $scope.turnMicOff();
         Video.alertMicOff(function(result){
            
         });
      }



      $scope.showOpponentVideo = function(){

                
                var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.current_opponent_id+"&url=rtmp://chat.mirbu.com/myapp&micOn=true&type=in" }; 
                

                if($rootScope.gender=='m') { // if man check balance and turn charging every min

                    Room.getBalance().then( function(result){

                        if(result.data.status==1){

                            $rootScope.emptyAccountAlert();
                            
                        } else {

                             swfobject.embedSWF("Media/chat.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                             $rootScope.isOpponentCamEnabled = true;

                        }
                    })                

                } else { // if woman just turn cam on

                        $rootScope.isOpponentCamEnabled = true;
                        swfobject.embedSWF("Media/chat.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                }
                
                Video.showOpponentCam($rootScope.current_opponent_id,function(result){});
               
                $('.video_online').removeClass('hide_chat_window');
                        
            }

           

            
        


      $scope.hideOpponentVideo = function(){
       
            swfobject.removeSWF("opponentVideo");
            $(document).find('#oponent_video_container').append('<div id="opponentVideo"></div>');
            $rootScope.isOpponentCamEnabled = false;
            $rootScope.alert_mic_on = false;
            $('.video_online').addClass('hide_chat_window');     
            alert('sssss');
             Video.hideOpponentCam($rootScope.current_opponent_id, function(){
                if (angular.isDefined($scope.invite_promise)) {
                    $interval.cancel($scope.invite_promise);
                    $scope.invite_promise = undefined;
                }                
            })     
            

        }



     




      $scope.showOpponentOnlyMic = function(){

                
                var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.current_opponent_id+"&url=rtmp://chat.mirbu.com/myapp&micOn=true&type=in" }; 
                

                if($rootScope.gender=='m') { // if man check balance and turn charging every min

                    Room.getBalance().then( function(result){

                        if(result.data.status==1){

                            $rootScope.emptyAccountAlert();
                            
                        } else {

                             swfobject.embedSWF("Media/chat.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                             Video.showOpponentOnlyMic($rootScope.current_opponent_id, function(){})     

                        }
                    })                

                } else { // if woman just turn cam on

                        swfobject.embedSWF("Media/chat_without_cam.swf", "opponentVideo", "100%", "100%", "9.0.0", "expressInstall.swf", par);
                        document["myVideo"].JsTurnMicOn();
                }
                $scope.opponent_only_mic_on = true;
                //alert($rootScope.opponent_only_mic_on);
                $('.video_online').removeClass('hide_chat_window');
                        
            }



      $scope.hideOpponentOnlyMic = function(){
       
            swfobject.removeSWF("opponentVideo");
            $(document).find('#oponent_video_container').append('<div id="opponentVideo"></div>');
            $scope.opponent_only_mic_on = false;
            $('.video_online').addClass('hide_chat_window');     

             Video.hideOpponentOnlyMic($rootScope.current_opponent_id, function(){});     
            

        }



    $rootScope.$on('close_video',function(event,data){

        $scope.hideOpponentVideo();
        $rootScope.emptyAccountAlert();
    })


    $rootScope.$on('show_my_video',function(event,data){
        $scope.showMyVideo();
    })

    $rootScope.$on('show_my_flash',function(event,data){
        $scope.showMyFlash();
    })


    $rootScope.$on('show_opponent_video',function(event,data){
        $scope.showOpponentVideo();
    })

    $rootScope.$on('hide_opponent_video',function(event,data){

        $scope.hideOpponentVideo();
    })


    $rootScope.$on('turn_opponent_mic_on',function(event,data){
        $scope.turnMicOn();
    })

    $rootScope.$on('turn_opponent_mic_off',function(event,data){
       $scope.turnMicOff();
    })

    $scope.$on('alert_mic_on',function(event,data){
        $scope.alert_mic_on = true;
    })

    $rootScope.$on('alert_mic_off',function(event,data){
       $scope.alert_mic_on = false;
       $scope.opponent_mic_on = false;
    })

    $scope.$on('only_mic_on',function(event,data){
       $scope.only_mic_on = true;
    })

    $rootScope.$on('only_mic_off',function(event,data){
       $scope.only_mic_on = false;
       $scope.opponent_only_mic_on = false;
       $scope.hideOpponentOnlyMic();
       
    })

    $scope.$on('opponent_mic_on',function(event,data){
       $scope.turnMicOn(); 
    })

    $rootScope.$on('opponent_mic_off',function(event,data){
       $scope.turnMicOff();
    })


    $rootScope.$on('update_cam_indicators',function(event,data){

        if(data.cam_status=='on') {
          $rootScope.active_cams['user_'+data.owner] = true;
        }   else {
          $rootScope.active_cams['user_'+data.owner] = false;
        }
        
        log($rootScope.active_cams);
        if (!event.defaultPrevented && typeof $rootScope.room_participants !== 'undefined') {
            event.defaultPrevented = true;
            for (var i = 0; i < $rootScope.room_participants.length; i++) {
                var val = $rootScope.room_participants[i];
                var arr = val.split('_');
                log(arr);
                if(arr[1]==data.owner && data.owner!= $rootScope.currentUserId){
                    log(data);
                    if(data.cam_status=='on') { 
                        $rootScope.isOpponentVideoActive = true;
                    } else {
                        swfobject.removeSWF("opponentVideo");
                        $(document).find('#oponent_video_container').append('<div id="opponentVideo"></div>');
                        $rootScope.isOpponentVideoActive = false;
                        $('.video_online').addClass('hide_chat_window');     

                    }
                    
                    $rootScope.isOpponentCamEnabled = false;
                    $rootScope.opponent_id = data.owner;
                    
                  } 
                        
                
            }
        //console.log('camera'+data.owner);

        //console.log($rootScope.room_participants);
            
        }

       
    });
     

     

    })




