Initialization
==============

.. uml::

    @startuml

        activate JS
        JS --> SS: is_auth
        activate SS
        SS --> JS: user_id
        deactivate SS
        deactivate JS
        JS --> JS: onConnect
        activate JS
        JS --> WS: connect
        deactivate JS
        activate WS
        WS --> WS: subscribe
        WS -->]: << Update online users >>
        deactivate WS

        activate JS
        JS --> SS: get_users_online (gender)
        activate SS
        SS --> JS: update_users_online
        deactivate JS
        deactivate SS

        
        JS --> SS: get_contact_list (user_id)
        activate JS
        activate SS
        SS --> JS: update_contact_list
        deactivate JS
        deactivate SS

        legend left
          <b>JS</b> javascript angularJS application
          <b>SS</b> signal server
          <b>WS</b> websocket server
        endlegend
        

    @enduml
