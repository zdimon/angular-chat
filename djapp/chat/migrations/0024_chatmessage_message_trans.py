# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0023_chatuser_activity'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatmessage',
            name='message_trans',
            field=models.TextField(verbose_name='Message', blank=True),
        ),
    ]
