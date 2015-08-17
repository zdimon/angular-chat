Database diagramm
=================


.. uml::
    :height: 800px

    @startuml
        skinparam class {
	        BackgroundColor PaleGreen
	        ArrowColor SeaGreen
	        BorderColor SpringGreen
        }
        skinparam stereotypeCBackgroundColor YellowGreen

        User --* ChatUser : contains
        Tpa --* ChatUser : contains
        ChatRoom *-- Tpa : contains
        ChatUser2Room *-- ChatUser : contains
        ChatUser2Room *-- ChatRoom : contains

        ChatMessage *-- ChatUser
        ChatMessage *-- Tpa

        ChatInvitations *-- Tpa
        ChatInvitations *-- ChatUser

        ChatContacts *-- ChatUser
        ChatContacts *-- Tpa

        ChatFriends *-- Tpa
        ChatFriends *-- ChatUser


        ChatTransactions *-- Tpa
        ChatTransactions *-- ChatUser
        ChatTransactions *-- ChatRoom

        class Tpa {
          String name
          String domain
          String name
          Int timeout_chating
        }

        class ChatUser {
            -String gender
            -FK user_id
            -String name
            -Int age
            -String email
            -String country
            -String city
            -String image
            -String prifile_url
            -String culture
            -Bool is_online  
            -Bool is_camera_active  
            -Bool is_invisible  
            -Bool is_invitation_enabled
            -Object[Tpa] tpa  
            +avatar()
                
        }


        class ChatInvitations {
          Object[ChatUser] from_user
          Object[ChatUser] to_user
          Object[Tpa] tpa
        }

        class ChatContacts {
          Object[ChatUser] owner
          Object[ChatUser] contact
          Object[Tpa] tpa
        }


        class ChatRoom {
            -Object[Tpa] tpa
            +add_user(user)
        }

        class ChatMessage {
            Object[Tpa] tpa
            Object[ChatUser] user
        }

        class ChatFriends {
            Object[Tpa] tpa
            Object[ChatUser] owner
            Object[ChatUser] friend
        }
        

        class ChatTransactions {
            Object[Tpa] tpa
            Object[ChatUser] man
            Object[ChatUser] woman
            Object[ChatRoom] room
        }


        class ChatTemplates {
            String message_ru
            String message_en
        }

        class ChatStopword {
            String word
            String replace
        }

    @enduml
