/*"""
videoCtrl.js
``````````````


Manipulate with video blocks.
 


*/

app.controller('VideoCtrl', function ($scope, $rootScope, $window, $log, Video,$interval, WS) {




        /*"""
        .. function:: $scope.$on('rootScope_ready'...


<param name="FlashVars" value="codecOn=true&ww=800&hh=600&fps=20&streamName={{ token }}&url=rtmp://{{ rtmp_domain }}/myapp&micOn=false&type={{ type }}" />

           
        */ 
      $scope.isMyVideoActive = false;

      $scope.showMyVideo = function(){
            var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+$rootScope.currentUserId+"&url=rtmp://chat.mirbu.com/myapp&micOn=false&type=out" };
            swfobject.embedSWF("Media/chat.swf", "myVideo", "320", "240", "9.0.0", "expressInstall.swf", par);
            $scope.isMyVideoActive = true;

            Video.showMyCam(function(){
                
            })
            
        }

  
      $scope.hideMyVideo = function(){

            $(document).find('#myVideoContainer').html('<div id="myVideo"> </div>');
            //swfobject.removeSWF("myVideo");
            $scope.isMyVideoActive = false;

            Video.hideMyCam(function(){
                
            })

        }


      $scope.showOpponentVideo = function(user_id){
  
             var par = { flashvars:"codecOn=true&ww=800&hh=600&fps=20&streamName="+local_config.app_name+'_'+user_id+"&url=rtmp://chat.mirbu.com/myapp&micOn=false&type=in" };
             swfobject.embedSWF("Media/chat.swf", "opponentVideo", "320", "240", "9.0.0", "expressInstall.swf", par);

             $rootScope.isOpponentCamEnabled = true;

             Video.showOpponentCam(function(result){
                // Initiate periodic calling to charge money
                $scope.invite_promise = $interval(function(){

                    WS.send({ 'action': 'video_charge', 
                              'user_id': $rootScope.currentUserId, 
                              'opponent_id': result.user_id, 
                              'room_id': $rootScope.room_id 
                            });

                }, 10000);

                
            })

            
        }


      $scope.hideOpponentVideo = function(){

            
            swfobject.removeSWF("opponentVideo");
            $(document).find('#oponent_video_container').append('<div id="opponentVideo"> </div>');
            $rootScope.isOpponentCamEnabled = false;
             Video.hideOpponentCam(function(){
                if (angular.isDefined($scope.invite_promise)) {
                    $interval.cancel($scope.invite_promise);
                    $scope.invite_promise = undefined;
                }                
            })          

        }




    $rootScope.$on('update_cam_indicators',function(event,data){
        if (!event.defaultPrevented) {
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
                        $rootScope.isOpponentVideoActive = false;
                    }
                    
                    $rootScope.isOpponentCamEnabled = false;
                    $rootScope.opponent_id = data.owner;
                    
                }
            }
        console.log('camera'+data.owner);

        console.log($rootScope.room_participants);
            
        }

       
    });
     

     

    })

