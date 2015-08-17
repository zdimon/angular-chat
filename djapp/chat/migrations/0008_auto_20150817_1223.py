# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0007_chatroom_activiti'),
    ]

    operations = [
        migrations.RenameField(
            model_name='chatroom',
            old_name='activiti',
            new_name='activity',
        ),
    ]
