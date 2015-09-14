# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0021_chattransactions_coins_audio'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatcontacts',
            name='activity',
            field=models.IntegerField(default=0, verbose_name='Activiti (sec)', blank=True),
        ),
    ]
