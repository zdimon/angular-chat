Integration
===========

Add follows javascripts into your header section.

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


Add follows javascripts into the bottom of your page.

.. code-block:: html

     <script src="/chatapp/utils.js"></script>
     <script src="/chatapp/tpapp.js"></script>
     <script src="/chatapp/services/websocket.js"></script>
     <script src="/chatapp/services/Online.js"></script>
     <script src="/chatapp/config.js"></script>
     <script src="/chatapp/local_config.js"></script>


Insert online indicator.

.. code-block:: html

    <x-online-indicator uid="online.user_<?php echo $user->id ?>"></x-online-indicator>

Or you can use ng-show directive to show and hide online indicator depending on  online.user_id variable in the angular's scope.

.. code-block:: html

    <a class="like int_pop" href="#invite_pop" ng-show="online.user_<?php echo $user->id ?>"></a>

Insert active cam indicator.

.. code-block:: html

    <li ng-show="activecam.user_<?php echo $girl->login ?>"></li>


Inviting link.

.. code-block:: html

    <a ng-click="invite(<?php echo $girl->login ?>)" class="web_chat "></a>








API
===

1. Request to get information about current user.

Request: http://localhost/chat-request/isLogin

Responce:

if logined

.. code-block:: python

    {"id":"150046","gender":"m","balance":"1000.00","success":true}

if not 

.. code-block:: python

    {"id":"0" ,"success":false}

2. Request to get user's balance.

    Request: [server]/api/[user_id]/[app_name]/get_balance

    Example: 


3. Request of charging money from user's account.

Input data

.. code-block:: python

            { 
              'action': 'video/text_chat', 
              'user_id': 150040, 
              'opponent_id': 150042, 
              'room_id': 23 
            } 

Where 

user_id - man

opponent_id - woman
 
room_id - identifier of the chat room. This parameter make it possible to collect the same payment in the one record of the database.

.. code-block:: python

    def charge(request):
        json_data = json.loads(request.body)
        sql = 'select id,coins from users where login="%s"' % json_data['user_id']
        user = bd.get(sql)
        if json_data['price']<user['coins']:
            new_coins = user['coins'] - json_data['price']
            sql = 'update users set coins=%s where id=%d' % (new_coins,user['id'])
            print sql
            bd.update(sql)
            status = 0
        else:
            status = 1
        return {'user_id': json_data['user_id'], 'account': user['coins'], 'status': status}












