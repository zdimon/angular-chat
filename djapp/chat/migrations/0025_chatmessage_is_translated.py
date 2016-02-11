# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0024_chatmessage_message_trans'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatmessage',
            name='is_translated',
            field=models.BooleanField(default=False, verbose_name='Is translated?'),
        ),
    ]
