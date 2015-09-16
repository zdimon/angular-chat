from djapp.local import TPA_SERVER
from djapp.settings import BASE_DIR, SS_SERVER

def read_conf():
    path = BASE_DIR+'/templates/config.js.tpl'
    ar = BASE_DIR.split('/')
    exec open(path).read()
    return apiconf

def get_url_by_name(name,dict_key):
    apiconf = read_conf()
    url = 'http://'+apiconf['api'][name]['url']
    try:
        url = url.replace('[server]',dict_key['signal_server'])
    except:
        url = url.replace('[server]',SS_SERVER)
    url = url.replace('[app_name]',dict_key['app_name'])
    for key in dict_key:
        url = url.replace('[%s]' % key, str(dict_key[key]))
    return url

