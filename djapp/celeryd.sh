#!/bin/bash
cd /home/webmaster/ngchat_ve/angular-chat/djapp
source ../../bin/activate
python manage.py celeryd
