Installation
============

Instalation on Ububnu Server 14.

Install Redis server.

.. code-block:: bash

    sudo apt-get install redis

Install python virtual environment packet.

.. code-block:: bash

    sudo apt-get install python-virtualenv

Create virtual environment.

.. code-block:: bash

    cd ~
    virtualenv chat_ve
    cd chat_ve

Clone repository.

.. code-block:: bash

    git clone git@github.com:zdimon/angular-chat.git

or

.. code-block:: bash

    git clone https://github.com/zdimon/angular-chat.git


Activate virtual environvent and install all the requirements.


.. code-block:: bash

    source ./bin/activate
    cd angular-chat
    pip install -r requirements.txt


Install NodeJs. 

.. code-block:: bash

    sudo apt-get install nodejs
    ln -s /usr/bin/nodejs /usr/bin/node


Install npm.

.. code-block:: bash

    sudo apt-get install npm

Install bower.


.. code-block:: bash

    sudo npm install -g bower

Install libraries from bower.json.

.. code-block:: bash

    bower install

Install nginx server.

.. code-block:: bash

    sudo apt-get install nginx

Edit etc/nginx/sites-enabled/default file. 

.. code-block:: bash

    sudo apt-get install nano
    sudo nano /etc/nginx/sites-enabled/default

Edit main server section.


.. code-block:: bash

    server {
	    listen 80 default_server;
        server_name  you-domain-name;
        root    /home/webmaster/path-to-www-dir;
        index   index.html;
    }    


Restart nginx server.

.. code-block:: bash

    sudo service nginx restart

Rename file _config.py to config.py. Then edit this file and put a correct information about your MySQL database connection.

Run socket server.

.. code-block:: bash

    python socketserver.py









