# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ChatContacts',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(auto_now=True)),
                ('has_new_message', models.BooleanField(default=False, help_text='Has unreaded messages.')),
                ('successfuly_connected', models.BooleanField(default=False, help_text='Opponent accepted invitation.')),
                ('is_active', models.BooleanField(default=False, help_text='User selected this contact the last.')),
                ('is_man_camera_active', models.BooleanField(default=False, help_text='Is man camera active.')),
                ('is_woman_camera_active', models.BooleanField(default=False, help_text='Is woman camera active.')),
                ('is_ununswerd', models.BooleanField(default=False, help_text='Is ununswerd.')),
            ],
            options={
                'verbose_name': 'Contact',
                'verbose_name_plural': 'Contacts',
            },
        ),
        migrations.CreateModel(
            name='ChatFriends',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(auto_now=True)),
                ('visible', models.BooleanField(default=True)),
            ],
            options={
                'ordering': ['-id'],
                'verbose_name': 'Chat friend',
                'verbose_name_plural': 'Chat friends',
            },
        ),
        migrations.CreateModel(
            name='ChatInvitations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(auto_now=True)),
                ('is_accepted', models.BooleanField(default=False)),
                ('from_token', models.CharField(max_length=250, blank=True)),
            ],
            options={
                'ordering': ['-id'],
                'verbose_name': 'Invitation',
                'verbose_name_plural': 'Invitations',
            },
        ),
        migrations.CreateModel(
            name='ChatMessage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('gender', models.CharField(default=b'm', max_length=1, verbose_name='Gender', choices=[(b'm', 'Man'), (b'w', 'Woman')])),
                ('message', models.TextField(verbose_name='Message', blank=True)),
                ('created', models.DateTimeField(auto_now=True)),
                ('is_old', models.BooleanField(default=False, verbose_name='Is active?')),
            ],
            options={
                'ordering': ['-id'],
                'verbose_name': 'message',
                'verbose_name_plural': 'Chat messages',
            },
        ),
        migrations.CreateModel(
            name='ChatRoom',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('duration', models.IntegerField(default=0, verbose_name='Duration (min)', blank=True)),
                ('sign', models.CharField(verbose_name='Identifier', max_length=250, editable=False, blank=True)),
                ('created', models.DateTimeField(auto_now=True, null=True)),
                ('is_charging', models.BooleanField(default=True, verbose_name='Allow charging?')),
                ('is_closed', models.BooleanField(default=False, verbose_name='Chat Closed')),
            ],
            options={
                'ordering': ['-id'],
                'verbose_name': 'Chat session',
                'verbose_name_plural': 'Chat sessions',
            },
        ),
        migrations.CreateModel(
            name='ChatStopword',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('word', models.CharField(db_index=True, max_length=250, verbose_name='Work', blank=True)),
                ('replace', models.CharField(default=b'***', max_length=250, verbose_name='Replace with', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='ChatTemplates',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('message_ru', models.TextField(verbose_name='Message russian', blank=True)),
                ('message_en', models.TextField(verbose_name='Message english', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='ChatTransactions',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(auto_now=True)),
                ('ammount', models.DecimalField(verbose_name='Price RUB', max_digits=12, decimal_places=2)),
            ],
        ),
        migrations.CreateModel(
            name='ChatUser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('gender', models.CharField(default=b'm', max_length=1, verbose_name='Gender', choices=[(b'm', 'Man'), (b'w', 'Woman')])),
                ('user_id', models.IntegerField(verbose_name='User ID from TPA', db_index=True)),
                ('name', models.CharField(max_length=128, verbose_name='Public name', blank=True)),
                ('birthday', models.DateField(null=True, verbose_name='birthday', blank=True)),
                ('email', models.CharField(max_length=128, verbose_name='E-Mail', blank=True)),
                ('country', models.CharField(max_length=64, null=True, verbose_name="User's country", blank=True)),
                ('city', models.CharField(max_length=64, null=True, verbose_name="User's city", blank=True)),
                ('image', models.CharField(max_length=128, null=True, verbose_name='Image', blank=True)),
                ('profile_url', models.CharField(max_length=250, verbose_name='Url on profile page in the client site', blank=True)),
                ('culture', models.CharField(blank=True, max_length=3, null=True, verbose_name='Users language code', choices=[(b'ru', b'Russian'), (b'en', 'English'), (b'ua', b'Ukrainian'), (b'fr', 'French'), (b'sp', 'Spain'), (b'de', 'German')])),
                ('is_online', models.IntegerField(default=0, db_index=True, verbose_name='Is user online now', choices=[(0, 'No'), (1, 'Yes')])),
                ('is_camera_active', models.BooleanField(default=False, verbose_name='Is active?')),
                ('is_invisible', models.BooleanField(default=False, verbose_name='Is user invisible')),
                ('is_invitation_enabled', models.BooleanField(default=True, verbose_name='Is invitations enabled?')),
            ],
        ),
        migrations.CreateModel(
            name='ChatUser2Room',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('is_video_watching', models.BooleanField(default=False, verbose_name='Is video watching?')),
                ('room', models.ForeignKey(verbose_name='Room', to='chat.ChatRoom')),
            ],
        ),
        migrations.CreateModel(
            name='Tpa',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'', max_length=250, verbose_name='Name', db_index=True, blank=True)),
                ('domain', models.CharField(max_length=250, verbose_name='Domain', blank=True)),
                ('secret', models.CharField(max_length=250, verbose_name='Secret key', blank=True)),
                ('timeout_chating', models.IntegerField(default=180, verbose_name='Chat timeout')),
            ],
            options={
                'verbose_name': 'Site',
                'verbose_name_plural': 'Sites',
            },
        ),
        migrations.AddField(
            model_name='chatuser2room',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chatuser2room',
            name='user',
            field=models.ForeignKey(verbose_name='User', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatuser',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chattransactions',
            name='man',
            field=models.ForeignKey(related_name='man', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chattransactions',
            name='room',
            field=models.ForeignKey(verbose_name='Chat session', blank=True, to='chat.ChatRoom', null=True),
        ),
        migrations.AddField(
            model_name='chattransactions',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chattransactions',
            name='woman',
            field=models.ForeignKey(related_name='woman', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatroom',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chatmessage',
            name='room',
            field=models.ForeignKey(verbose_name='Chat session', to='chat.ChatRoom'),
        ),
        migrations.AddField(
            model_name='chatmessage',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chatmessage',
            name='user',
            field=models.ForeignKey(verbose_name='User', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatinvitations',
            name='from_user',
            field=models.ForeignKey(related_name='from_user', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatinvitations',
            name='to_user',
            field=models.ForeignKey(related_name='to_user', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatinvitations',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chatfriends',
            name='friend',
            field=models.ForeignKey(related_name='friend_user', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatfriends',
            name='owner',
            field=models.ForeignKey(related_name='friend_owner_user', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatfriends',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='contact',
            field=models.ForeignKey(related_name='contact_user', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='owner',
            field=models.ForeignKey(related_name='contact_owner_user', to='chat.ChatUser'),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='room',
            field=models.ForeignKey(verbose_name='Chat session', blank=True, to='chat.ChatRoom', null=True),
        ),
        migrations.AddField(
            model_name='chatcontacts',
            name='tpa',
            field=models.ForeignKey(verbose_name='TPA', to='chat.Tpa'),
        ),
        migrations.AlterUniqueTogether(
            name='chatuser',
            unique_together=set([('user_id', 'tpa')]),
        ),
    ]
