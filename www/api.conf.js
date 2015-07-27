apiconf = {
    'config':
    {
        'app_id': 1,
        'app_name': 'tpa1com',
        'signal_server': 'chat.localhost',
        'ws_server': 'chat.localhost:8888'
    },

    'api':
    {

        'login':
            {
                'type': 'ajax',
                'name': 'login',
                'url':  '[server]/api/[user_id]/login'
            },

        'logout':
            {
                'type': 'ajax',
                'name': 'logout',
                'url':  '[server]/api/logout'
            },


        'is_auth':
            {
                'type': 'ajax',
                'name': 'is_auth',
                'url':  '[server]/api/[app_name]/is_auth'
            },    

        'has_opponent':
            {
                'type': 'ajax',
                'name': 'has_opponent',
                'url':  '[server]/api/[user_id]/has_opponent'
            },  

        'get_online':
            {
                'type': 'ajax',
                'name': 'get_online',
                'url':  '[server]/api/[app_name]/get_online'
            },  


        'get_contact_list':
            {
                'type': 'ajax',
                'name': 'get_contact_list',
                'url':  '[server]/api/[app_name]/[user_id]/get_contact_list'
            },

        'get_profile_from_tpa':
            {
                'type': 'ajax',
                'name': 'get_profile_from_tpa',
                'url':  '[server]/api/get_profile_from_tpa/[user_id]'
            },

        'get_profile':
            {
                'type': 'ajax',
                'name': 'get_profile',
                'url':  '[server]/api/get_profile/[user_id]'
            },  

        'add_contact':
            {
                'type': 'ajax',
                'name': 'add_contact',
                'url':  '[server]/api/[app_name]/[owner_id]/[contact_id]/add_contact'
            },  

        'del_contact':
            {
                'type': 'ajax',
                'name': 'del_contact',
                'url':  '[server]/api/[app_name]/[owner_id]/[contact_id]/del_contact'
            }

        'get_room_or_create':
            {
                'type': 'ajax',
                'name': 'get_room_or_create',
                'url':  '[server]/api/[caler_id]/[caler_id]/get_room_or_create'
            }


    }
    
}
