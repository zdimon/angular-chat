# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0003_auto_20150723_1434'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chatuser',
            name='culture',
            field=models.CharField(blank=True, max_length=3, null=True, verbose_name='Users language code', choices=[(b'ru', b'Russian'), (b'en', 'English'), (b'ua', b'Ukrainian'), (b'fr', 'French'), (b'sp', 'Spain'), (b'de', 'German')]),
        ),
    ]
