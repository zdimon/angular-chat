Deployment on Ubuntu 14.04 server 
---------------------------------

Update soft

.. code-block:: bash

    sudo apt-get update

Generate locale

.. code-block:: bash

    sudo locale-gen uk_UA
    sudo locale-gen uk_UA.UTF-8

Install nginx

.. code-block:: bash

    sudo apt-get install nginx


Install redis

.. code-block:: bash

    sudo apt-get install redis-server


Install python tools

.. code-block:: bash

    sudo apt-get install python-dev python-virtualenv    

Install Mysql

.. code-block:: bash

    sudo apt-get install mysql-server libmysqlclient-dev


Set remote access to mysql

.. code-block:: bash

    sudo nano /etc/mysql/my.cnf

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

    sudo apt-get install php5-fpm php5-gd php5-mcrypt php5-mysql


Install git

.. code-block:: bash

    sudo apt-get install git



Add user

.. code-block:: bash

    sudo adduser webmaster 

Change user
    
.. code-block:: bash

    su webmaster       

Generate ssh key

.. code-block:: bash

    ssh-keygen -t rsa

Add keys to github.


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


Install FTP

.. code-block:: bash

    sudo apt-get install pure-ftpd 


Install cpanel.


.. code-block:: bash

   wget -O- https://raw.github.com/ajenti/ajenti/1.x/scripts/install-ubuntu.sh | sudo sh
   apt-get install ajenti-v ajenti-v-nginx ajenti-v-mysql ajenti-v-php-fpm php5-mysql ajenti-v-ftp-vsftpd


Rebuild nginx with rtmp module. 

Open file **/etc/apt/sources.list**

Add two lines.

.. code-block:: bash

    deb http://nginx.org/packages/ubuntu/ trusty nginx
    deb-src http://nginx.org/packages/ubuntu/ trusty nginx

Download and install key.

.. code-block:: bash

    wget http://nginx.org/keys/nginx_signing.key -O - | apt-key add -

Create directory where we will keep source code.

.. code-block:: bash

    mkdir nginx
    cd nginx

Install the required soft.

    apt-get install libssl-dev libxslt1-dev libgd-dev libgeoip-dev libpcre3-dev
    apt-get update 

Get source code of nginx and rtmp module.

    apt-get source nginx
    git clone https://github.com/arut/nginx-rtmp-module.git


Build nginx

    cd nginx-1.8.0

    ./configure --with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-ipv6 --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_gzip_static_module --with-http_image_filter_module --with-http_spdy_module --with-http_sub_module --with-http_xslt_module --with-mail --with-mail_ssl_module --add-module=../nginx-rtmp-module

    make


Add rtmp server section into **/etc/nginx/nginx.conf**


.. code-block:: bash

    rtmp {
        server {
            chunk_size 4000;
            listen 1935;
            application myapp {
                live on;
                allow play all;
                allow publish all;
            }
        }
    }



Backup system via S3
--------------------

Create busket 'bridesbackup' in S3 section.





