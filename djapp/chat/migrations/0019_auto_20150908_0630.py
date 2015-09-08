# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0018_auto_20150907_0821'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatroom',
            name='is_charging_audio',
            field=models.BooleanField(default=False, verbose_name='Allow charging for audio?'),
        ),
        migrations.AlterField(
            model_name='tpa',
            name='favorite_url',
            field=models.CharField(max_length=250, verbose_name='Url for add/delete/get favorite', blank=True),
        ),
    ]
