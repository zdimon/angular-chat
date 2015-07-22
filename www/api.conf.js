apiconf = {
    'config':
    {
        'app_id': 1,
        'app_name': 'tpa1com',
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

        'has_opponent':
            {
                'type': 'ajax',
                'name': 'has_opponent',
                'url':  '[server]/api/has_opponent'
            },  

        'get_online':
            {
                'type': 'ajax',
                'name': 'get_online',
                'url':  '[server]/api/get_online'
            },  

        'get_contact_list':
            {
                'type': 'ajax',
                'name': 'get_contact_list',
                'url':  '[server]/api/get_contact_list'
            }

    }
    
}
