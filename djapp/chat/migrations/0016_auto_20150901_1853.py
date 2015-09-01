# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0015_chatblocklist_tpa'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatcontacts',
            name='chat_with_cam',
            field=models.BooleanField(default=False, help_text='Chat with cam'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='chat_without_cam',
            field=models.BooleanField(default=False, help_text='Chat without cam'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='is_answered',
            field=models.BooleanField(default=False, help_text='Is answered'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='is_ignored',
            field=models.BooleanField(default=False, help_text='Is answered'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='waiting_for_answer',
            field=models.BooleanField(default=False, help_text='Waiting for answer'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='watch_profile',
            field=models.BooleanField(default=False, help_text='Watch profile'),
        ),
    ]
