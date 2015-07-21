from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    url(r'^$', 'chat.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^api/get_online/(?P<app_id>[^\.]+)$', 'chat.views.get_online'),
    url(r'^admin/', include(admin.site.urls)),
]
