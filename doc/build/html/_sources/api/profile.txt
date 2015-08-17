Profile
=======

.. toctree::
    :maxdepth: 2
 


**get_profile** method. 
======================= 

This request get information about user's profile.


**Request**

*http://server.name/_prefix_/get_profile*

Body.

.. code-block:: bash

    { 'app_id': 2, 'user_id': 34 }



**Responce**

.. code-block:: bash

    { 'username': 'Tim', 'gender': 'm|w', 'age': '34', 'city': 'London', 'Country': 'UK', 'image': 'url-to-image', 'language': 'en' }





**invalidate_profile** method. 
============================== 

This request fires when profile was changed and removes profile from chat's cache to forse it to download information one more time.


**Request**

*http://_server.name_/_prefix_/invalidate_profile*

Body.

.. code-block:: bash

    { 'app_id': 2, 'user_id': 34 }



**Responce**

.. code-block:: bash

    { 'status': 0 , 'message': 'ok' }


**delete_profile** method. 
============================== 

This request fires when profile was deleted.


**Request**

*http://_server.name_/_prefix_/invalidate_profile*

Body.

.. code-block:: bash

    { 'app_id': 2, 'user_id': 34 }



**Responce**

.. code-block:: bash

    { 'status': 0 , 'message': 'ok' }


