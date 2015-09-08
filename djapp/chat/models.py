# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext_lazy as _
import json
from django.utils.safestring import mark_safe
from datetime import datetime, date
import time


# Create your models here.
class Tpa(models.Model):
    ''' Third Part Applications. Table with sites which integrate this chat.
    Field 'name' uses as app_id in all API requests. '''
    class Meta:
        verbose_name = "Site"
        verbose_name_plural = "Sites"
    name = models.CharField(max_length = 250, blank = True, default='', verbose_name = _('Name'), db_index = True)
    domain = models.CharField(max_length = 250, blank = True, verbose_name = _('Domain'))
    secret = models.CharField(max_length = 250, blank = True, verbose_name = _('Secret key'))
    charge_url = models.CharField(max_length = 250, blank = True, verbose_name = _('Url for charging'))
    get_balance_url = models.CharField(max_length = 250, blank = True, verbose_name = _('Url for geting balance'))
    favorite_url = models.CharField(max_length = 250, blank = True, verbose_name = _('Url for add/delete/get favorite'))
    message_url = models.CharField(max_length = 250, blank = True, verbose_name = _('Url for send offline message to messagebox'))
    billing_page = models.CharField(max_length = 250, blank = True, verbose_name = _('Link (url) to the billing page'))
    timeout_chating = models.IntegerField(verbose_name = _('Chat timeout'), default = 180)
    price_text_chat = models.DecimalField( verbose_name=_('Price of text chating'), max_digits= 12, decimal_places= 2, default="1")
    price_video = models.DecimalField( verbose_name=_('Price of video watching'), max_digits= 12, decimal_places= 2, default="2")
    price_audio = models.DecimalField( verbose_name=_('Price of audio broadcasting'), max_digits= 12, decimal_places= 2, default="2")
    def __unicode__(self):
        return self.domain


class ChatUser(models.Model):
    ''' Information about users. Username, gender and so on...  '''
    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"

    GENDERS = ( ('m', _('Man')), ('w', _('Woman')) )
    CULTURES = ( ('ru', ('Russian')), ('en', _('English')), ('ua', 'Ukrainian'), ('fr', _('French')), ('sp', _('Spain')), ('de', _('German')) )
    ONLINE = ( (0, _('No')), (1, _('Yes')) )

    gender = models.CharField(max_length = 1, choices = GENDERS, default = 'm', verbose_name = _('Gender'))
    user_id = models.IntegerField(db_index=True, verbose_name = _('User ID from TPA'))
    name = models.CharField(max_length = 128, blank = True, verbose_name = _('Public name'))
    birthday = models.DateField(blank = True, null = True, verbose_name = _('birthday'))
    email = models.CharField(max_length = 128, blank = True, verbose_name = _('E-Mail'))
    country = models.CharField(max_length = 64, blank = True, null= True, verbose_name = _('User\'s country'))
    city = models.CharField(max_length = 64, blank = True, null = True, verbose_name = _('User\'s city'))
    image = models.CharField(max_length = 128, blank = True, null = True, verbose_name = _('Image'))
    profile_url = models.CharField(max_length = 250, blank = True, verbose_name = _('Url on profile page in the client site'))
    culture = models.CharField(max_length = 3, choices = CULTURES, blank = True, null = True, verbose_name = _('Users language code'))
    is_online = models.IntegerField(default = 0, choices = ONLINE, verbose_name = _('Is user online now'), db_index=True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA')) # client_id
    is_camera_active = models.BooleanField(verbose_name = _('Is active?'), default = False)
    is_invisible = models.BooleanField(default = False, verbose_name = _('Is user invisible'))
    is_invitation_enabled = models.BooleanField(default = True, verbose_name = _('Is invitations enabled?'))
    class Meta:
        unique_together = ('user_id','tpa',)
    @property  
    def avatar(self):
        return mark_safe(u'ss<img src="%s" />' % self.image)  
    def __unicode__(self):
        return self.name
    @property
    def age(self):
        today = date.today()
        if self.birthday:
            try:
                birthday = self.birthday.replace(year=today.year)
            except ValueError: # raised when birth date is February 29 and the current year is not a leap year
                birthday = self.birthday.replace(year=today.year, day=self.birthday.day-1)
            if birthday > today:
                b = today.year - self.birthday.year - 1
            else:
                b = today.year - self.birthday.year
        return '%d' % b



class ChatRoom(models.Model):
    ''' Chat sessions. '''
    duration = models.IntegerField(blank = True, verbose_name = _('Duration (min)'), default = 0)
    sign = models.CharField(max_length = 250, blank = True, verbose_name = _('Identifier'), editable = False)
    created = models.DateTimeField( auto_now = True, blank = True, null = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    is_charging_text = models.BooleanField(verbose_name = _('Allow charging for text?'), default = False)
    is_charging_video = models.BooleanField(verbose_name = _('Allow charging for video?'), default = False)
    is_charging_audio = models.BooleanField(verbose_name = _('Allow charging for audio?'), default = False)
    is_closed = models.BooleanField(verbose_name = _('Chat Closed'), default = False)
    activity = models.IntegerField(blank = True, verbose_name = _('Activiti (sec)'), default = 0)
    class Meta:
        verbose_name = _("Chat session")
        verbose_name_plural = _("Chat sessions")
        ordering = ['-id']

    def __unicode__(self):
        return _(u'Chat session #') + u' ' + str(self.pk)

        
    def add_user(self,user):
        try:
            ChatUser2Room.object.get(user = user, room = self)
        except:
            u2r = ChatUser2Room()
            u2r.user = user
            u2r.room = self
            u2r.tpa = self.tpa
            u2r.save()    

    def set_sign(self):
        from time import gmtime, strftime
        t = strftime("%Y-%m-%d %H:%M:%S", gmtime())
        import hashlib
        hash_object = hashlib.md5(t)
        self.sign = hash_object.hexdigest()
    
    def get_last_message(self):
        try:
            return ChatMessage.objects.filter(room=self).order_by('-id')[0:1][0]
        except:
            return None

    def get_last_message_enother_user(self,mes):
        self.activity = int(time.time())
        self.save()
        try:
            return ChatMessage.objects.filter(room=self).exclude(user=mes.user).order_by('-id')[0:1][0]
        except:
            return None



        
    def get_participants(self):
        items = ChatUser2Room.objects.filter(room = self).all()
        out = []
        for i in items:
            out.append(i.user)
        return out
        
    def get_participantsm2m(self):
        items = ChatUser2Room.objects.filter(room = self).all()
        return items        
        
    def get_participants_except_user(self,user):
        items = ChatUser2Room.objects.filter(room = self).exclude(user=user).all()
        out = []
        for i in items:
            out.append(i.user)
        return out

    def get_count_messages(self):
        return ChatMessage.objects.filter(room=self).count()

    def close_me(self,user):
        import brukva
        bclient = brukva.Client()
        bclient.connect()    
        #import pdb; pdb.set_trace()
        for u in self.get_participants():          
            mes = { 'act': 'i_live_room', 'chanel': 'wc_%s_%s' % (u.id , self.tpa.id) }
            destination = '%s_%s' % (self.tpa.id, u.id)
            bclient.publish(destination, json.dumps(mes))
            print 'Try to close %s' % destination

class ChatUser2Room(models.Model):
    ''' Relation between user and chat session. '''
    user = models.ForeignKey(ChatUser, verbose_name = _('User'))
    room = models.ForeignKey(ChatRoom, verbose_name = _('Room'))
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    is_video_watching = models.BooleanField(verbose_name = _('Is video watching?'), default = False)
    def __unicode__(self):
        return _(u'Chat user 2 room relation')


class ChatMessage(models.Model):
    ''' Chat messages. '''
    GENDERS = ( ('m', _('Man')), ('w', _('Woman')) )
    gender = models.CharField(max_length = 1, choices = GENDERS, default = 'm', verbose_name = _('Gender'))
    user = models.ForeignKey(ChatUser, verbose_name = _('User'))
    room = models.ForeignKey(ChatRoom, verbose_name = _('Chat session'))
    message = models.TextField(blank = True, verbose_name = _('Message'))
    created = models.DateTimeField( default=datetime.now, blank = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    is_old = models.BooleanField(verbose_name = _('Is active?'), default = False)
    class Meta:
        verbose_name = _("message")
        verbose_name_plural = _("Chat messages")
        ordering = ["-id"]

    def __unicode__(self):
        return _(u'Chat message')




class ChatContacts(models.Model):
    ''' User's contacts. '''
    owner = models.ForeignKey(ChatUser, related_name = 'contact_owner_user')
    contact = models.ForeignKey(ChatUser, related_name = 'contact_user')
    created = models.DateTimeField(auto_now = True, blank = True)
    has_new_message = models.BooleanField(default = False, help_text=_('Has unreaded messages.'))
    waiting_for_answer = models.BooleanField(default = False, help_text=_('Waiting for answer'))
    is_answered = models.BooleanField(default = False, help_text=_('Is answered'))
    is_ignored = models.BooleanField(default = False, help_text=_('Is answered'))
    chat_with_cam = models.BooleanField(default = False, help_text=_('Chat with cam'))
    chat_without_cam = models.BooleanField(default = False, help_text=_('Chat without cam'))
    watch_profile = models.BooleanField(default = False, help_text=_('Watch profile'))
    successfuly_connected = models.BooleanField(default = False, help_text=_('Opponent accepted invitation.'))
    is_active = models.BooleanField(default = False, help_text=_('User selected this contact the last.'))
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    room = models.ForeignKey(ChatRoom, verbose_name = _('Chat session'),blank = True, null = True)
    is_man_camera_active = models.BooleanField(default = False, help_text=_('Is man camera active.'))
    is_woman_camera_active = models.BooleanField(default = False, help_text=_('Is woman camera active.'))
    is_ununswerd = models.BooleanField(default = False, help_text=_('Is ununswerd.'))
    def set_active(self,rm):
        room = ChatRoom.objects.get(pk=rm)
        ChatContacts.objects.filter(owner=self.owner).update(is_active=False)
        self.is_active = True
        self.has_new_message = False
        self.room = room
        self.save()
    class Meta:
        verbose_name = "Contact"
        verbose_name_plural = "Contacts"

    def __unicode__(self):
        pass





class ChatTransactions(models.Model):
    ''' History of transactions '''
    room = models.ForeignKey(ChatRoom, verbose_name = _('Chat session'),blank = True, null = True)
    man = models.ForeignKey(ChatUser, related_name = 'man')
    woman = models.ForeignKey(ChatUser, related_name = 'woman')
    created = models.DateTimeField( auto_now = True, blank = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    coins_text = models.DecimalField( verbose_name=_('Coins for text chating'), max_digits= 12, decimal_places= 2)
    coins_video = models.DecimalField( verbose_name=_('Coins for video'), max_digits= 12, decimal_places= 2)
    coins_audio = models.DecimalField( verbose_name=_('Coins for audio'), max_digits= 12, decimal_places= 2, default="0.00")



class ChatTemplates(models.Model):
    ''' Templates of phrases that often in use during conversation.'''
    message_ru = models.TextField(blank = True, verbose_name = _('Message russian'))
    message_en = models.TextField(blank = True, verbose_name = _('Message english'))


class ChatStopword(models.Model):
    ''' Bad words that will be rejected from the message. '''
    word = models.CharField(max_length = 250, blank = True, verbose_name = _('Work'), db_index=True)
    replace = models.CharField(max_length = 250, blank = True, verbose_name = _('Replace with'), default="***")



class ChatBlocklist(models.Model):
    ''' Block list '''
    user_id = models.IntegerField(db_index=True, verbose_name = _('User who did blocke'))
    block_id = models.IntegerField(db_index=True, verbose_name = _('User who is blocked'))
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))









