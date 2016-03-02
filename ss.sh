#!/bin/bash
sudo kill $(lsof -t -i:8888)
cd /home/zdimon/www/ngchat_ve
source ./bin/activate
cd /home/zdimon/www/ngchat_ve/chat/djapp
python manage.py runserver 0.0.0.0:8888
