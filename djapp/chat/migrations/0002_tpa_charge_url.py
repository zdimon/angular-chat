# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='tpa',
            name='charge_url',
            field=models.CharField(max_length=250, verbose_name='Url for charging', blank=True),
        ),
    ]
