# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0005_auto_20150814_1338'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatroom',
            name='is_charging',
            field=models.BooleanField(default=False, verbose_name='Allow charging?'),
        ),
    ]
