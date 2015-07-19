Chat invitation
===============

.. uml::

    @startuml

        participant "Man JS" as M
        participant "Woman JS" as W

        activate M
        M --> WS: invite
        activate WS
        WS --> WS: check accessebility
        WS --> W: show_inv_win
        deactivate WS
        deactivate M
        activate W
        W-->W: show pop up window
        W-->WS: accept invitation
        activate WS
        deactivate W
        WS --> SS: create room
        activate SS
        SS-->WS: room_id
        deactivate WS
        deactivate SS
        WS-->W: put_in_contact_list
        activate WS
        WS-->M: put_in_room (room_id)
        WS-->W: put_in_room (room_id)
        WS-->M: update_users_online
        WS-->W: update_users_online
        deactivate WS
        

        

        legend left
          <b>JS</b> javascript angularJS application
          <b>SS</b> signal server
          <b>WS</b> websocket server
        endlegend

    @enduml
