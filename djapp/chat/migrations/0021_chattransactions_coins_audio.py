# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0020_tpa_price_audio'),
    ]

    operations = [
        migrations.AddField(
            model_name='chattransactions',
            name='coins_audio',
            field=models.DecimalField(default=b'0.00', verbose_name='Coins for audio', max_digits=12, decimal_places=2),
        ),
    ]
