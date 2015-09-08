# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0019_auto_20150908_0630'),
    ]

    operations = [
        migrations.AddField(
            model_name='tpa',
            name='price_audio',
            field=models.DecimalField(default=b'2', verbose_name='Price of audio broadcasting', max_digits=12, decimal_places=2),
        ),
    ]
