Angular application
===================


.. uml::

    @startuml

        package "ChatApp" {
          
            package Router {

                            
                            object user {
                              url: "/"
                              templateUrl: "/templates/index.html"
                            }


                         }

            package Controller {
            
                    object RegistrationController {

                    }

                    object ChatUserOnline {

                    }
                            
            }    

           
                package Service {
                                
                }      

                package Directive {
                                
                } 

                object Websocket {
                   
                }

                Websocket --o ChatUserOnline


            }
          

       

    @enduml

