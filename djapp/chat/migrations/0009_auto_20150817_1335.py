# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0008_auto_20150817_1223'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChatUserBlocked',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('owner', models.IntegerField(verbose_name='Owner', db_index=True)),
                ('bloked', models.IntegerField(verbose_name='Blocked', db_index=True)),
                ('created', models.DateTimeField(auto_now=True)),
                ('tpa', models.ForeignKey(verbose_name='TPA', to='chat.Tpa')),
            ],
        ),
        migrations.RemoveField(
            model_name='chatfriends',
            name='friend',
        ),
        migrations.RemoveField(
            model_name='chatfriends',
            name='owner',
        ),
        migrations.RemoveField(
            model_name='chatfriends',
            name='tpa',
        ),
        migrations.DeleteModel(
            name='ChatFriends',
        ),
    ]
