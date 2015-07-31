Chat invitation from man
========================

.. uml::

    @startuml

        participant "Man JS" as M
        participant "Woman JS" as W
        participant "Django server" as SS
        participant "Tornado websocket server" as WS
        
        activate M
        M --> SS: invite (opponent_id, owner_id)
        note left: RoomCtrl.scope.invite()
        deactivate M
        
        activate SS
        SS --> SS: add to contact
        note left: djapp.views.room.invite

      

        activate WS
        SS-->WS: update_contact
        note right: ws.processor
        activate M
        WS-->M: update_contact
        note left: ContactCtrl.scope.update()
        deactivate M
        deactivate WS
        
        SS --> SS: check accessebility
        SS --> SS: get_room_or_create

        
        activate WS
        SS --> WS: put_me_in_room (room_id)
        
        activate M
        WS-->M: put_me_in_room
        deactivate SS
        note left: RoomCtrl.scope.put_me_in_room(room_id)
        deactivate M
        deactivate WS
        

        
        M-->SS: save_message
        activate SS
        note left: RoomCtrl.scope.send_message()
        SS-->WS: show_message
        deactivate SS
        activate WS
        activate M
        WS-->M: show_message
        note left: RoomCtrl.scope.show_message()
        deactivate M
        activate W
        WS-->W: show_message
        note left: RoomCtrl.scope.show_message()
        deactivate W
        SS-->WS: update_contact
        note left: ContactCtrl.scope.update()
        activate W
        WS-->W: update_contact
        deactivate W
        deactivate WS
        
        
        

        

        legend left
          <b>JS</b> javascript angularJS application
          <b>SS</b> signal server
          <b>WS</b> websocket server
        endlegend

    @enduml
