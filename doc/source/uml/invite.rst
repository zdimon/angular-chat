Chat invitation
===============

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
        note left: RoomCtrl.scope.put_me_in_room(room_id)
        deactivate M
        deactivate WS
        

        SS --> WS: show_inv_win
        note left: RoomCtrl.scope.show_invitation_win()
        activate WS
        WS --> W: show_inv_win
        deactivate SS
        deactivate WS
        deactivate M
        activate W
        W-->W: show pop up window
        W-->SS: accept invitation
        note right: djapp.views.room.accept_intitation()
        activate SS
        deactivate W
        

        activate WS
        SS-->WS: put_me_in_room(room_id)
        note left: RoomCtrl.scope.put_me_in_room(room_id)
        activate W
        WS-->W: put_me_in_room(room_id)
        deactivate WS
        W-->SS: add_to_contact
        SS-->W: update_contact
        deactivate WS
        deactivate W
        deactivate SS
        
        
        

        

        legend left
          <b>JS</b> javascript angularJS application
          <b>SS</b> signal server
          <b>WS</b> websocket server
        endlegend

    @enduml
