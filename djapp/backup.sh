#!/bin/bash
cd ~/ngchat_ve/angular-chat/djapp
source ../../bin/activate
./manage.py dbbackup
./manage.py mediabackup
