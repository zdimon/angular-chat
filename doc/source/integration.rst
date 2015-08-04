Integration
===========

1. Add follows javascripts into your header section.

.. code-block:: html

     <script src="/chatapp/app.js"></script>
     <script src="/chatapp/controllers/controllers.js"></script>
     <script src="/chatapp/controllers/roomCtrl.js"></script>
     <script src="/chatapp/routers.js"></script>
     <script src="/chatapp/services/Auth.js"></script>
     <script src="/chatapp/services/Online.js"></script>
     <script src="/chatapp/services/Contact.js"></script>
     <script src="/chatapp/services/Room.js"></script>
     <script src="/chatapp/directives/chat-invitation.js"></script>
     <script src="/chatapp/directives/chat-translator.js"></script>
     <script src="/chatapp/services/websocket.js"></script>
     <script src="/chatapp/utils.js"></script>
     <script src="/chatapp/config.js"></script>
     <script src="/chatapp/local_config.js"></script>


2. Add follows javascripts into the bottom of your page.

.. code-block:: html

     <script src="/chatapp/utils.js"></script>
     <script src="/chatapp/tpapp.js"></script>
     <script src="/chatapp/services/websocket.js"></script>
     <script src="/chatapp/services/Online.js"></script>
     <script src="/chatapp/config.js"></script>
     <script src="/chatapp/local_config.js"></script>


3. Insert online indicator.

.. code-block:: html

    <x-online-indicator uid="online.user_<?php echo $user->id ?>"></x-online-indicator>

Or you can use ng-show directive to show and hide online indicator depending on  online.user_id variable in the angular's scope.

.. code-block:: html

    <a class="like int_pop" href="#invite_pop" ng-show="online.user_<?php echo $user->id ?>"></a>

4. Insert active cam indicator.

.. code-block:: html

    <li ng-show="activecam.user_<?php echo $user->id ?>"><a href="#invite_to_chat" class="web_chat invite_to_chat"></a></li>





