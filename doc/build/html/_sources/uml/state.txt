State diagramms
===============

Invitation
==========

Process of infitation. It starts when user click on the icon in user online.

.. uml::

    @startuml

    [*] --> Invite
    OnlineCtrl --> [*]
    OnlineCtrl : .invite(opponent_id)
    OnlineCtrl : change url on #/owner_id/opponent_id
    OnlineCtrl : call Room.invite(contact_id) function   
   

    OnlineCtrl -> Room.invite
    Room: http request to Django api_view/room.invite()

    @enduml


