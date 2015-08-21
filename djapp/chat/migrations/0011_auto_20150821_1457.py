# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0010_auto_20150817_1346'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chattransactions',
            name='ammount',
            field=models.DecimalField(verbose_name='Ammount', max_digits=12, decimal_places=2),
        ),
    ]
