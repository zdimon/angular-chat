from django.contrib import admin
from chat.models import *

# Register your models here.
class TpaAdmin(admin.ModelAdmin):
    list_display = ("id","name", "domain", "timeout_chating")
admin.site.register(Tpa, TpaAdmin)

class ChatUserAdmin(admin.ModelAdmin):
    list_display = ("user_id","name", "avatar", "gender", "birthday", "country", "city", "culture", "is_online", "image", "profile_url", "is_camera_active", "is_invisible", "tpa")
    search_fields = ("name", "country", "city")
    list_filter = ("tpa", "is_online", "gender")
    def avatar(self, instance):
        return u'<img width="100" src="%s" />' % instance.image
    avatar.allow_tags = True
admin.site.register(ChatUser, ChatUserAdmin)

class ChatMessageAdminInline(admin.TabularInline):
    model = ChatMessage
    fields = ["message", "user", "avatar"]
    readonly_fields = ["message", "user", "avatar"]
    def avatar(self, instance):
        return u'<img width="100" src="{0}" />'.format(instance.user.image)
    avatar.allow_tags = True


class ChatRoomAdmin(admin.ModelAdmin):
    list_display = ("id", "duration", "sign", "tpa", "is_charging_text", "is_charging_video")
    search_fields = ("sign", )
    list_filter = ("tpa", )
    inlines = [
        ChatMessageAdminInline,
    ]
    def participants(self, instance):
        out = ''
        for u in instance.get_participants():
            out = out + u'<img title="{1}" width="100" src="{0}" />'.format(u.image, u.name)
        return out
    participants.allow_tags = True
admin.site.register(ChatRoom, ChatRoomAdmin)

class ChatMessageAdmin(admin.ModelAdmin):
    list_display = ("room", "user", "message", "tpa")
    list_filter = ("tpa", "room" )
admin.site.register(ChatMessage, ChatMessageAdmin)


class ChatTransactionsAdmin(admin.ModelAdmin):
    list_display = ("man", "woman", "room", "tpa", 'coins_text', 'coins_video', 'created')
    list_filter = ("tpa", "room", "tpa")
admin.site.register(ChatTransactions, ChatTransactionsAdmin)


class ChatTemplatesAdmin(admin.ModelAdmin):
    list_display = ("message_ru", "message_en")
admin.site.register(ChatTemplates, ChatTemplatesAdmin)


class ChatStopwordAdmin(admin.ModelAdmin):
    list_display = ("word", "replace")
admin.site.register(ChatStopword, ChatStopwordAdmin)

class ChatContactsAdmin(admin.ModelAdmin):
    list_display = ("owner", "contact")
admin.site.register(ChatContacts, ChatContactsAdmin)

class ChatUser2RoomAdmin(admin.ModelAdmin):
    list_display = ("user", "room", "tpa")
admin.site.register(ChatUser2Room, ChatUser2RoomAdmin)
