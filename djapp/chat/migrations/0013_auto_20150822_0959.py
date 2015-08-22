# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0012_auto_20150822_0909'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chatroom',
            name='is_charging',
        ),
        migrations.AddField(
            model_name='chatroom',
            name='is_charging_text',
            field=models.BooleanField(default=False, verbose_name='Allow charging for text?'),
        ),
        migrations.AddField(
            model_name='chatroom',
            name='is_charging_video',
            field=models.BooleanField(default=False, verbose_name='Allow charging for video?'),
        ),
    ]
