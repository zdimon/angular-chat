from django.conf.urls import include, url
from django.contrib import admin
from utils.util import read_conf
from django.conf.urls import include, url, patterns

read_conf()

admin.autodiscover()


urlpatterns = [
    # Examples:
    url(r'^$', 'chat.views.home', name='home'),
    url(r'^test$', 'chat.views.test', name='test'),

    url(r'^api/login$', 'chat.views.login'),
    url(r'^api/logout$', 'chat.views.login'),

    url(r'^admin/', include(admin.site.urls)),
]


from utils.util import read_conf
import re
apiconf = read_conf()

for i in apiconf['api']:
    a = apiconf['api'][i]['url'].replace('[server]/','')
    for par in re.findall('\[(.*?)\]',a):
        a = a.replace('[%s]' % par, '(?P<%s>[^\.]+)' % par)
    urlpatterns += patterns(
        '',
        url(r'^%s$' % a,'chat.views.'+apiconf['api'][i]['name'])
        )
