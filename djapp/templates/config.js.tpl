
apiconf = {
        'api': 
        {


        'logout':
            {
                'type': 'ajax',
                'name': 'logout',
                'url':  '[server]/api/logout'
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
                'url':  '[server]/api/[app_name]/[user_id]/get_online',
                'responce': '{"status": 0, "message": "ok", "user_list": [{...}]'
            },  

        'get_online_except_contact':
            {
                'type': 'ajax',
                'name': 'get_online_except_contact',
                'url':  '[server]/api/[app_name]/[user_id]/get_online_except_contact',
                'responce': '{"status": 0, "message": "ok", "user_list": [{...}]'
            },  



        'get_contact_list':
            {
                'type': 'ajax',
                'name': 'get_contact_list',
                'url':  '[server]/api/[app_name]/[user_id]/get_contact_list'
            },

        'mark_watching_profile':
            {
                'type': 'ajax',
                'name': 'mark_watching_profile',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/mark_watching_profile'
            },


        'get_profile_from_tpa':
            {
                'type': 'ajax',
                'name': 'get_profile_from_tpa',
                'url':  '[server]/api/[app_name]/get_profile_from_tpa/[user_id]'
            },

        'get_profile':
            {
                'type': 'ajax',
                'name': 'get_profile',
                'url':  '[server]/api/[app_name]/get_profile/[user_id]'
            },   

        'invite':
            {
                'type': 'ajax',
                'name': 'invite',
                'url':  '[server]/api/[app_name]/[owner_id]/[contact_id]/invite'
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
            },
  

        'del_all_contacts':
            {
                'type': 'ajax',
                'name': 'del_all_contacts',
                'url':  '[server]/api/[app_name]/[owner_id]/del_all_contacts'
            },

        'get_room_or_create':
            {
                'type': 'ajax',
                'name': 'get_room_or_create',
                'url':  '[server]/api/[app_name]/[caler_id]/[opponent_id]/get_room_or_create'
            },

        'save_message':
            {
                'type': 'ajax[POST]',
                'name': 'save_message',
                'url':  '[server]/api/save_message',
                'params': 'app_name,owner_id,room_id,message'
            },

        'send_invitation':
            {
                'type': 'ajax[POST]',
                'name': 'send_invitation',
                'url':  '[server]/api/send_invitation',
                'params': 'app_name,owner_id,opponent_id,message'
            },

        'send_message':
            {
                'type': 'ajax[POST]',
                'name': 'send_message',
                'url':  '[server]/api/send_message',
                'params': 'app_name,owner_id,opponent_id,message'
            },

        'multi_invitation':
            {
                'type': 'ajax[POST]',
                'name': 'multi_invitation',
                'url':  '[server]/api/multi_invitation',
                'params': 'app_name,owner_id,opponent_id,message'
            },


        'get_messages':
            {
                'type': 'ajax',
                'name': 'get_messages',
                'url':  '[server]/api/[room_id]/get_messages'
            } ,


        'show_my_cam':
            {
                'type': 'ajax',
                'name': 'show_my_cam',
                'url':  '[server]/api/[user_id]/[app_name]/show_my_cam'
            } ,


        'hide_my_cam':
            {
                'type': 'ajax',
                'name': 'hide_my_cam',
                'url':  '[server]/api/[user_id]/[app_name]/hide_my_cam'
            } ,

        'show_opponent_cam':
            {
                'type': 'ajax',
                'name': 'show_opponent_cam',
                'url':  '[server]/api/[user_id]/[opponent_id]/[app_name]/[room_id]/show_opponent_cam'
            } ,

        'hide_opponent_cam':
            {
                'type': 'ajax',
                'name': 'hide_opponent_cam',
                'url':  '[server]/api/[user_id]/[opponent_id]/[app_name]/[room_id]/hide_opponent_cam'
            }, 


        'show_feather':
            {
                'type': 'ajax',
                'name': 'show_feather',
                'url':  '[server]/api/[app_name]/[room_id]/[opponent_id]/show_feather'
            },

        'close_chat_room':
            {
                'type': 'ajax',
                'name': 'close_chat_room',
                'url':  '[server]/api/[app_name]/[room_id]/[opponent_id]/close_chat_room'
            },


        'block_user':
            {
                'type': 'ajax',
                'name': 'block_user',
                'url':  '[server]/api/[app_name]/[user_id]/[block_id]/block_user'
            },


        'unblock_user':
            {
                'type': 'ajax',
                'name': 'unblock_user',
                'url':  '[server]/api/[app_name]/[user_id]/[block_id]/unblock_user'
            },

        'check_block_user':
            {
                'type': 'ajax',
                'name': 'check_block_user',
                'url':  '[server]/api/[app_name]/[user_id]/[block_id]/check_block_user'
            },


        'say_busy':
            {
                'type': 'ajax',
                'name': 'say_busy',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/say_busy'
            },


        'get_balance':
            {
                'type': 'outapi',
                'name': 'get_balance',
                'url':  '{{ tpa.get_balance_url }}'
            },

         




        }
    
}
