# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0004_auto_20150723_1438'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='chatuser',
            options={},
        ),
        migrations.AlterUniqueTogether(
            name='chatuser',
            unique_together=set([('user_id', 'tpa')]),
        ),
    ]
