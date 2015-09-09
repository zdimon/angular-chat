from django.conf.urls import include, url
from django.contrib import admin
from utils.util import read_conf
from django.conf.urls import include, url, patterns

read_conf()

admin.autodiscover()


urlpatterns = [
    # Examples:
    url(r'^$', 'chat.views.home', name='home'),
    url(r'^api/(?P<app_name>[^\.]+)/config.js$', 'chat.views.config', name='config'), # simulate tpa request handler
    url(r'^admin/', include(admin.site.urls)),

    #outcome API
     url(r'^api/(?P<user_id>[^\.]+)/(?P<app_name>[^\.]+)/get_balance$', 'chat.views.get_balance', name='get_balance'),




]


from utils.util import read_conf
import re
apiconf = read_conf()

for i in apiconf['api']:
    if apiconf['api'][i]['type'] != 'outapi':
        a = apiconf['api'][i]['url'].replace('[server]/','')
        for par in re.findall('\[(.*?)\]',a):
            a = a.replace('[%s]' % par, '(?P<%s>[^\.]+)' % par)
        urlpatterns += patterns(
            '',
            url(r'^%s$' % a,'chat.views.'+apiconf['api'][i]['name'])
            )
