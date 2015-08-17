# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0009_auto_20150817_1335'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chatinvitations',
            name='from_user',
        ),
        migrations.RemoveField(
            model_name='chatinvitations',
            name='to_user',
        ),
        migrations.RemoveField(
            model_name='chatinvitations',
            name='tpa',
        ),
        migrations.RemoveField(
            model_name='chatuserblocked',
            name='tpa',
        ),
        migrations.DeleteModel(
            name='ChatInvitations',
        ),
        migrations.DeleteModel(
            name='ChatUserBlocked',
        ),
    ]
