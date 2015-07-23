# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chatuser',
            name='age',
        ),
        migrations.AddField(
            model_name='chatuser',
            name='birthday',
            field=models.DateField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='chatuser',
            name='user_id',
            field=models.CharField(max_length=64, verbose_name='User ID from TPA', blank=True),
        ),
    ]
