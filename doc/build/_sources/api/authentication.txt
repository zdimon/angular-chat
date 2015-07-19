Authentication
==============

**is_auth** method. 
=================== 

This request fires every time during SPA initialization.
The response has to return user id or null in case if user is not logined.

**Request**

*http://server.name/_prefix_/is_auth*

Body.

.. code-block:: bash

    { 'app_id': 2 }



**Responce**

.. code-block:: bash

    { 'status': 0, 'user_id': 12 }

or

.. code-block:: bash

    { 'status': 1, 'message': 'User is not authorized' }



**login** method. 
================= 

This request tries authorize user by username and password.


**Request**

*http://_server.name_/_prefix_/login*

Body.

.. code-block:: bash

    { 'app_id': 2, 'username': 'master', 'password': '****' }



**Responce**

.. code-block:: bash

    { 'status': 0 , 'user_id': 12 }

or

.. code-block:: bash

    { 'status': 1, 'message': 'Login or password is not correct' }



