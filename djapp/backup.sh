#!/bin/bash
cd ~/www/ngchat_ve/chat/djapp
source ../../bin/activate
./manage.py dbbackup
./manage.py mediabackup
