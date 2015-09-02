# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0016_auto_20150901_1853'),
    ]

    operations = [
        migrations.AddField(
            model_name='tpa',
            name='favorite_url',
            field=models.CharField(max_length=250, verbose_name='Url for add/delete from favorite', blank=True),
        ),
        migrations.AddField(
            model_name='tpa',
            name='message_url',
            field=models.CharField(max_length=250, verbose_name='Url for send offline message to messagebox', blank=True),
        ),
    ]
