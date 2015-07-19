Disconect
=========


.. uml::

    @startuml

        activate JS
        JS --> JS: onClose
        JS --> WS: disconnect
        activate WS
        WS-->WS: onClose
        WS -->JS2: update online users
        WS -->JS3: update online users
        deactivate JS
        deactivate WS
        

        legend left
          <b>JS</b> javascript angularJS application
          <b>SS</b> signal server
          <b>WS</b> websocket server
        endlegend

    @enduml
        
