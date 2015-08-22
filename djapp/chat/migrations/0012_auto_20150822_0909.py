# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0011_auto_20150821_1457'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chattransactions',
            name='ammount',
        ),
        migrations.AddField(
            model_name='chattransactions',
            name='coins_text',
            field=models.DecimalField(default=0, verbose_name='Coins for text chating', max_digits=12, decimal_places=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='chattransactions',
            name='coins_video',
            field=models.DecimalField(default=0, verbose_name='Coins for video', max_digits=12, decimal_places=2),
            preserve_default=False,
        ),
    ]
