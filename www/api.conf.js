apiconf = {
    'config':
    {
        'app_id': 1,
        'signal_server': 'chat.localhost',
        'ws_server': 'localhost:8888'
    },

    'api':
    {
        'is_auth':
            {
                'type': 'ajax',
                'name': 'is_auth',
                'url':  '[server]/api/is_auth'
            },    

        'get_online':
            {
                'type': 'ajax',
                'name': 'get_online',
                'url':  '[server]/api/get_online'
            }  

    }
    
}
