Owerview
========


.. uml::

    @startuml
        left to right direction
        package "ChatApp" {
           


                            
            object .run {
              method: "Auth.isauth"
            }

            


        package "Services" {

            

            object Auth {
                +isauth()
                +login()
                +logout()
                +register()
            }

            object Message {
                +send()
                +get()
                +translate()
            }

            object Contact {
                +add()
                +get()
                +delete()
                +deleteAll()
            }

            object Visibe {
                +setVisible()
                +setInvisible()
            }

            object Online {
                +setOnline()
                +setOffline()
                +getOnline()
            }

            object Video {
                +turnOn()
                +turnOff()
                +showOpponentVideo()
                +removeOpponentVideo()
            }
            

            object Invite {
                +send()
                +accept()
                +reject()
            }

            object Room {
                +putInRoom(id)
                +closeRoom(id)
            }

        }

        package "Controller" {

            object UserOnlineCtrl {

            }

            object ContactListCtrl {

            }

            object ChatRoomCtrl {

            }

            object MyVideoCtrl {

            }

            object OpponentVideoCtrl {

            }

        }

        package "Directive" {

            object MessageForm {

            }

            object MessageList {

            }


            object Smiles {

            }

            object Templates {

            }


            object UserCamera {

            }

        }

   }


            Auth --o .run
            Online --o UserOnlineCtrl
            Message --o ChatRoomCtrl
            Room --o ChatRoomCtrl
            ContactListCtrl o-- Contact
            MyVideoCtrl o-- Video
            OpponentVideoCtrl o-- Video

    @enduml

Angular app initialization
==========================

.. uml::

    @startuml

        (*) --> "Auth.is_auth"

        if "Is authorized?" then
            -->[yes] "Check opponent?"
            if "Is opponent?" then
                -->[yes] "Online.getOnline()" as getOnline2
                --> "Contact.get()" as cg2
                --> "Room.putInRoom()" as pr
                -->[Ending process] (*)
            else
                -->[no] "Online.getOnline()" as getOnline3
                --> "Contact.get()" as cg1
                -->[Ending process] (*)
            endif
        else
          ->[no] "Online.getOnline()"
          -->[Ending process] (*)
        endif

    @enduml

