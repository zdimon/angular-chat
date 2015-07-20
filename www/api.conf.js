apiconf = {
    'config':
    {
        'app_id': 1,
        'signal_server': 'localhost:8000',
        'ws_server': 'localhost:8888'
    },

    'api':
    {
        'is_auth':
            {
                'type': 'ajax',
                'name': 'is_auth',
                'url':  '[server]/api/is_auth'
            }    
    }
    
}
