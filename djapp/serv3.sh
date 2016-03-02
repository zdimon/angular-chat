#!/bin/bash
kill $(lsof -t -i:8884)
cd /home/webmaster/ngchat_ve/angular-chat/djapp
source ../../bin/activate
python manage.py runserver 0.0.0.0:8884
