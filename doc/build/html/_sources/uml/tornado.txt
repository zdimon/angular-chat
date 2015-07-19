Tornado Websocket server application
====================================

.. uml::

    @startuml
        skinparam class {
	        BackgroundColor PaleGreen
	        ArrowColor SeaGreen
	        BorderColor SpringGreen
        }
        
        class WSHandler {
            -Object[MessageProcessor] processor
            +__init__()
            +open()
            +on_message()
            +on_close()
        }


        class MessageProcessor {
            +__init__()
            +subscribe()
            +handle()
        }

        WSHandler o-- MessageProcessor
        

    @enduml
