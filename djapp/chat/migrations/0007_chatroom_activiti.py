# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0006_auto_20150817_1201'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatroom',
            name='activiti',
            field=models.IntegerField(default=0, verbose_name='Activiti (sec)', blank=True),
        ),
    ]
