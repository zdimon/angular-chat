# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0013_auto_20150822_0959'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChatBlocklist',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user_id', models.IntegerField(verbose_name='User who did blocke', db_index=True)),
                ('block_id', models.IntegerField(verbose_name='User who is blocked', db_index=True)),
            ],
        ),
    ]
