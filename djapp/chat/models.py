# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext_lazy as _
import json
from django.utils.safestring import mark_safe
from datetime import datetime
import time
# Create your models here.
class Tpa(models.Model):
    ''' Third Part Applications. Table with sites which integrate this chat.
    Primary key used as app_id in all API requests. '''
    class Meta:
        verbose_name = "Site"
        verbose_name_plural = "Sites"
    name = models.CharField(max_length = 250, blank = True, default='', verbose_name = _('Name'), db_index = True)
    domain = models.CharField(max_length = 250, blank = True, verbose_name = _('Domain'))
    secret = models.CharField(max_length = 250, blank = True, verbose_name = _('Secret key'))
    timeout_chating = models.IntegerField(verbose_name = _('Chat timeout'), default = 180)
    def __unicode__(self):
        return self.domain

class ChatUser(models.Model):
    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"

    GENDERS = ( ('m', _('Man')), ('w', _('Woman')) )
    CULTURES = ( ('ru', ('Russian')), ('en', _('English')), ('ua', 'Ukrainian'), ('fr', _('French')), ('sp', _('Spain')), ('de', _('German')) )
    ONLINE = ( (0, _('No')), (1, _('Yes')) )

    gender = models.CharField(max_length = 1, choices = GENDERS, default = 'm', verbose_name = _('Gender'))
    user_id = models.CharField(max_length = 64, verbose_name = _('User ID'), blank = True)
    signature = models.CharField(max_length = 64, verbose_name = _('User hash'), blank = True, null = True)
    name = models.CharField(max_length = 128, blank = True, verbose_name = _('Public name'))
    age = models.IntegerField(max_length = 2, default = 0, verbose_name = _('Age'))
    email = models.CharField(max_length = 128, blank = True, verbose_name = _('E-Mail'))
    country = models.CharField(max_length = 64, blank = True, verbose_name = _('User\'s country'))
    city = models.CharField(max_length = 64, blank = True, verbose_name = _('User\'s city'))
    image = models.CharField(max_length = 128, blank = True, null = True, verbose_name = _('Image'))
    profile_url = models.CharField(max_length = 250, blank = True, verbose_name = _('Url on profile page in the client site'))
    culture = models.CharField(max_length = 3, choices = CULTURES, verbose_name = _('Users language code'))
    is_online = models.IntegerField(max_length = 1, default = 0, choices = ONLINE, verbose_name = _('Is user online now'), db_index=True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA')) # client_id
    account = models.DecimalField(verbose_name=_(u'Account'), max_digits=10, decimal_places=2, default=0)
    is_camera_active = models.BooleanField(verbose_name = _('Is active?'), default = False)
    is_invisible = models.BooleanField(default = False, verbose_name = _('Is user invisible'))
    is_invitation_enabled = models.BooleanField(default = True, verbose_name = _('Is invitations enabled?'))
    @property  
    def avatar(self):
        return mark_safe(u'<img src="%s" />' % self.image)  
    def __unicode__(self):
        return self.name



class ChatRoom(models.Model):
    duration = models.IntegerField(blank = True, verbose_name = _('Duration (min)'))
    sign = models.CharField(max_length = 250, blank = True, verbose_name = _('Identifier'), editable = False)
    created = models.DateTimeField(auto_now_add = True, auto_now = True, blank = True, null = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    is_charging = models.BooleanField(verbose_name = _('Allow charging?'), default = True)
    class Meta:
        verbose_name = _("Chat session")
        verbose_name_plural = _("Chat sessions")
        ordering = ['-id']

    def __unicode__(self):
        return _(u'Chat session №') + u' ' + str(self.pk)

        
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
    user = models.ForeignKey(ChatUser, verbose_name = _('User'))
    room = models.ForeignKey(ChatRoom, verbose_name = _('Room'))
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    def __unicode__(self):
        return _(u'Chat user 2 room relation')


class ChatMessage(models.Model):
    GENDERS = ( ('m', _('Man')), ('w', _('Woman')) )
    gender = models.CharField(max_length = 1, choices = GENDERS, default = 'm', verbose_name = _('Gender'))
    user = models.ForeignKey(ChatUser, verbose_name = _('User'))
    room = models.ForeignKey(ChatRoom, verbose_name = _('Chat session'))
    message = models.TextField(blank = True, verbose_name = _('Message'))
    created = models.DateTimeField(auto_now_add = True, auto_now = True, blank = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    is_old = models.BooleanField(verbose_name = _('Is active?'), default = False)
    class Meta:
        verbose_name = _("message")
        verbose_name_plural = _("Chat messages")
        ordering = ["-id"]

    def __unicode__(self):
        return _(u'Chat message')


class ChatInvitations(models.Model):
    from_user = models.ForeignKey(ChatUser, related_name = 'from_user')
    to_user = models.ForeignKey(ChatUser, related_name = 'to_user')
    created = models.DateTimeField(auto_now_add = True, auto_now = True, blank = True)
    is_accepted = models.BooleanField(default = False)
    from_token = models.CharField(max_length = 250, blank = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))

    class Meta:
        verbose_name = "Invitation"
        verbose_name_plural = "Invitations"
        ordering = ['-id']

    def __unicode__(self):
        pass

class ChatContacts(models.Model):
    owner = models.ForeignKey(ChatUser, related_name = 'contact_owner_user')
    contact = models.ForeignKey(ChatUser, related_name = 'contact_user')
    created = models.DateTimeField(auto_now_add = True, auto_now = True, blank = True)
    has_new_message = models.BooleanField(default = False, help_text=_('Has unreaded messages.'))
    successfuly_connected = models.BooleanField(default = False, help_text=_('Opponent accepted invitation.'))
    is_active = models.BooleanField(default = False, help_text=_('User selected this contact the last.'))
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    room = models.ForeignKey(ChatRoom, verbose_name = _('Chat session'),blank = True, null = True)
    is_man_camera_active = models.BooleanField(default = False, help_text=_('Is man camera active.'))
    is_woman_camera_active = models.BooleanField(default = False, help_text=_('Is woman camera active.'))
    is_ununswerd = models.BooleanField(default = False, help_text=_('Is ununswerd.'))

    class Meta:
        verbose_name = "Contact"
        verbose_name_plural = "Contacts"

    def __unicode__(self):
        pass


class ChatFriends(models.Model):
    owner = models.ForeignKey(ChatUser, related_name = 'friend_owner_user')
    friend = models.ForeignKey(ChatUser, related_name = 'friend_user')
    created = models.DateTimeField(auto_now_add = True, auto_now = True, blank = True)
    visible = models.BooleanField(default = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))

    class Meta:
        verbose_name = _("Chat friend")
        verbose_name_plural = _("Chat friends")
        ordering = ['-id']

    def __unicode__(self):
        pass


class ChatTransactions(models.Model):
    ''' History of transactions '''
    room = models.ForeignKey(ChatRoom, verbose_name = _('Chat session'),blank = True, null = True)
    man = models.ForeignKey(ChatUser, related_name = 'man')
    woman = models.ForeignKey(ChatUser, related_name = 'woman')
    created = models.DateTimeField(auto_now_add = True, auto_now = True, blank = True)
    tpa = models.ForeignKey(Tpa, verbose_name = _('TPA'))
    ammount = models.DecimalField( verbose_name=_('Price RUB'), max_digits= 12, decimal_places= 2)



class ChatTemplates(models.Model):
    message_ru = models.TextField(blank = True, verbose_name = _('Message russian'))
    message_en = models.TextField(blank = True, verbose_name = _('Message english'))


class ChatStopword(models.Model):
    word = models.CharField(max_length = 250, blank = True, verbose_name = _('Work'), db_index=True)
    replace = models.CharField(max_length = 250, blank = True, verbose_name = _('Replace with'), default="***")








