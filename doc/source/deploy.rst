Deployment on Ubuntu 14.04 server platform in Amazon
----------------------------------------------------

Update soft

.. code-block:: bash

    sudo apt-get update

Install nginx

.. code-block:: bash

    sudo apt-get install nginx


Install redis

.. code-block:: bash

    sudo apt-get install redis-server


Install python tools

.. code-block:: bash

    sudo apt-get install python-dev, python-virtualenv    

Install Mysql

.. code-block:: bash

    sudo apt-get install mysql, libmysqlclient-dev


Set remote access to mysql

.. code-block:: bash

    nano /etc/mysql/my.cnf

comment following lines

.. code-block:: bash

    #bind-address           = 127.0.0.1  


Restart mysql server.

.. code-block:: bash

    service mysql restart

Connect to mysql client

.. code-block:: bash

    mysql -u root -ppassword

.. code-block:: bash

    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'PASSWORD' WITH GRANT OPTION;

Install php5

.. code-block:: bash

    sudo apt-get install php5-fpm, php5-gd, php5-mcrypt, php5-mysql


Install git

.. code-block:: bash

    sudo apt-get install git



Generate locale

.. code-block:: bash

    sudo locale-gen uk_UA
    sudo locale-gen uk_UA.UTF-8

Add user

.. code-block:: bash

    sudo adduser webmaster 

Change user_ptr
    
.. code-block:: bash

    su webmaster       

Generate ssh key

.. code-block:: bash

    ssh-keygen -t rsa



Make virtual environment


.. code-block:: bash

    virtualenv achat_ve
    cd achat_ve
    source bin/activate

Install chat app


.. code-block:: bash

    git clone git@github.com:zdimon/angular-chat.git
    cd angular-chat
    pip install -r requirements.txt


Make nginx virtual host. 


.. code-block:: bash

    server {
        listen 80;
        server_name amazon.mirbu.com;
        location =/favicon.ico { empty_gif; }
        root    /home/webmaster/marriage-brides.com;

        fastcgi_buffer_size   128k;
        fastcgi_buffers   4 256k;
        fastcgi_busy_buffers_size   256k;

        location /api {
	    proxy_pass http://127.0.0.1:8008/api;
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Credentials' 'true';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
        }

        location /chatapp {
	    alias /home/webmaster/ngchat_ve/angular-chat/www/js/app/;
        }

        location /admin {
	    alias /home/webmaster/marriage-brides.com/Backend;
            index index.php;
            try_files $uri /index.php?$args;
        }

    location /agency {
          alias /home/webmaster/marriage-brides.com/Agency/;
        }


        location /doc {
	    alias /home/webmaster/ngchat_ve/angular-chat/doc/build/html/;
        }

        location /static {
            alias /home/webmaster/ngchat_ve/angular-chat/www/;
        }

       location / {
            index index.php;
            try_files $uri /index.php?$args;
        }
        location ~ \.php$ {
                   # fastcgi_pass 127.0.0.1:9000; 
                    fastcgi_pass unix:/var/run/php5-fpm.sock;
                    fastcgi_index  index.php;
                    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
                    fastcgi_param  SCRIPT_NAME     $fastcgi_script_name;
                    fastcgi_param  QUERY_STRING    $args;
                    include        fastcgi_params;
        }
    }








    


    
    

