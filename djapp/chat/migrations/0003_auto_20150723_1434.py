# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0002_auto_20150723_0945'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatuser',
            name='birthday',
            field=models.DateField(null=True, verbose_name='birthday', blank=True),
        ),
        migrations.AlterField(
            model_name='chatuser',
            name='city',
            field=models.CharField(max_length=64, null=True, verbose_name="User's city", blank=True),
        ),
        migrations.AlterField(
            model_name='chatuser',
            name='country',
            field=models.CharField(max_length=64, null=True, verbose_name="User's country", blank=True),
        ),
    ]
