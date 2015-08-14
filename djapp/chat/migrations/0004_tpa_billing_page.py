# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0003_tpa_get_balance_url'),
    ]

    operations = [
        migrations.AddField(
            model_name='tpa',
            name='billing_page',
            field=models.CharField(max_length=250, verbose_name='Link (url) to the billing page', blank=True),
        ),
    ]
