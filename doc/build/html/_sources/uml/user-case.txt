User case diagramm
==================

.. uml::

    @startuml
        title Man user case diagramm
        Man --> (Contact list) 
        (Contact list) --> (Delete one)
        (Contact list) --> (Delete all)
        (Contact list) --> (Select contact)
        Man -right-->  (Online list)
        (Online list) --> (Invite to chat)
        (Online list) --> (Search)
        Man -left-->  (Video) 
        (Video) --> (Turn on)
        (Video) --> (Turn off)
        Man -up-->  (Send message) 
        (Send message) --> (Add smile)
        (Send message) --> (Translate)
        (Send message) --> (Add template)
        Man -up-->  (Close chat)
        Man -up-->  (Close room)  


    @enduml

.. uml::

    @startuml
        title Woman user case diagramm
        Woman --> (Contact list) 
        (Contact list) --> (Delete one)
        (Contact list) --> (Delete all)
        (Contact list) --> (Select contact)
        Woman -right-->  (Online list)
        (Online list) --> (Invite to chat)
        (Online list) --> (Search)
        Woman -left-->  (Video) 
        (Video) --> (Turn on)
        (Video) --> (Turn off)
        Woman -up-->  (Send message) 
        (Send message) --> (Add smile)
        (Send message) --> (Translate)
        (Send message) --> (Add template)
        Woman -up-->  (Close chat)
        Woman -up-->  (Close room)  
        Woman -up-->  (Translate all messages)  
        Woman -left-->  (Invite men)  

    @enduml
