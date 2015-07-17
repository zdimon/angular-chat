from django.db import models


class ContactManager(models.Model):

    def get_contact_list(self, user, tpa) :
        from .models import ChatContacts
        contacts =  ChatContacts.objects.filter(owner=user, tpa=tpa).all().order_by('-is_active')
        return contacts
