# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0004_tpa_billing_page'),
    ]

    operations = [
        migrations.AddField(
            model_name='tpa',
            name='price_text_chat',
            field=models.DecimalField(default=b'1', verbose_name='Price of text chating', max_digits=12, decimal_places=2),
        ),
        migrations.AddField(
            model_name='tpa',
            name='price_video',
            field=models.DecimalField(default=b'2', verbose_name='Price of video watching', max_digits=12, decimal_places=2),
        ),
    ]
