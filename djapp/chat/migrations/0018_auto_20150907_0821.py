# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0017_auto_20150902_1222'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatmessage',
            name='created',
            field=models.DateTimeField(default=datetime.datetime.now, blank=True),
        ),
    ]
