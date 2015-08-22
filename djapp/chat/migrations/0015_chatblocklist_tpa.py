# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0014_chatblocklist'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatblocklist',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
            preserve_default=False,
        ),
    ]
