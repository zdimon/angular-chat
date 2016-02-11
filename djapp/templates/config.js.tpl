
apiconf = {
        'api': 
        {


        'logout':
            {
                'type': 'ajax',
                'name': 'logout',
                'url':  '[server]/api/logout'
            },

        'initialization':
            {
                'type': 'ajax',
                'name': 'initialization',
                'url':  '[server]/api/[app_name]/[user_id]/[contact_id]/initialization'
            }, 
        

        'update_user':
            {
                'type': 'ajax',
                'name': 'update_user',
                'url':  '[server]/api/[app_name]/[user_id]/update_user',
                'responce': '{"status": 0, "message": "ok", }]'
            },  


        'set_connected':
            {
                'type': 'ajax',
                'name': 'set_connected',
                'url':  '[server]/api/[app_name]/[user_id]/[source]/set_connected',
                'responce': '{"status": 0, "message": "ok", }]'
            }, 

        'set_disconnected':
            {
                'type': 'ajax',
                'name': 'set_disconnected',
                'url':  '[server]/api/[app_name]/[user_id]/[source]/set_disconnected',
                'responce': '{"status": 0, "message": "ok", }]'
            }, 

        'get_online':
            {
                'type': 'ajax',
                'name': 'get_online',
                'url':  '[server]/api/[app_name]/[user_id]/get_online',
                'responce': '{"status": 0, "message": "ok", "user_list": [{...}]'
            },  

        'get_online_ids':
            {
                'type': 'ajax',
                'name': 'get_online_ids',
                'url':  '[server]/api/[app_name]/[user_id]/get_online_ids',
                'responce': '{"status": 0, "message": "ok", "user_list": [150043,150042]'
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

        'get_contact_list_ids':
            {
                'type': 'ajax',
                'name': 'get_contact_list_ids',
                'url':  '[server]/api/[app_name]/[user_id]/get_contact_list_ids'
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
                'url':  '[server]/api/[app_name]/[user_id]/get_profile'
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

        'turn_mic_on':
            {
                'type': 'ajax',
                'name': 'turn_mic_on',
                'url':  '[server]/api/[user_id]/[app_name]/turn_mic_on'
            } ,

        'turn_mic_off':
            {
                'type': 'ajax',
                'name': 'turn_mic_off',
                'url':  '[server]/api/[user_id]/[app_name]/turn_mic_off'
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
                'url':  '[server]/api/[app_name]/[room_id]/[opponent_id]/[user_id]/close_chat_room'
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

        'say_close':
            {
                'type': 'ajax',
                'name': 'say_close',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/say_close'
            },

        'accept_invitation':
            {
                'type': 'ajax',
                'name': 'accept_invitation',
                'url':  '[server]/api/[app_name]/[user_id]/accept_invitation'
            },

        'decline_invitation':
            {
                'type': 'ajax',
                'name': 'decline_invitation',
                'url':  '[server]/api/[app_name]/[user_id]/decline_invitation'
            },

        'check_accessebility':
            {
                'type': 'ajax',
                'name': 'check_accessebility',
                'url':  '[server]/api/[app_name]/[user_id]/check_accessebility'
            },

        'charge_request':
            {
                'type': 'ajax[POST]',
                'name': 'charge_request',
                'url':  '[server]/api/[app_name]/charge_request'
            },


        'get_favorites':
            {
                'type': 'ajax',
                'name': 'get_favorites',
                'url':  '[server]/api/[app_name]/[user_id]/get_favorites'
            },

        'add_favorite':
            {
                'type': 'ajax',
                'name': 'add_favorite',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/add_favorite'
            },

        'del_favorite':
            {
                'type': 'ajax',
                'name': 'del_favorite',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/del_favorite'
            },


        'alert_mic_on':
            {
                'type': 'ajax',
                'name': 'alert_mic_on',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/alert_mic_on'
            },

        'alert_mic_off':
            {
                'type': 'ajax',
                'name': 'alert_mic_off',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/alert_mic_off'
            },

        'only_mic_on':
            {
                'type': 'ajax',
                'name': 'only_mic_on',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/only_mic_on'
            },

        'only_mic_off':
            {
                'type': 'ajax',
                'name': 'only_mic_off',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/only_mic_off'
            },

        'hide_opponent_only_mic':
            {
                'type': 'ajax',
                'name': 'hide_opponent_only_mic',
                'url':  '[server]/api/[user_id]/[opponent_id]/[app_name]/[room_id]/hide_opponent_only_mic'
            },

        'show_opponent_only_mic':
            {
                'type': 'ajax',
                'name': 'show_opponent_only_mic',
                'url':  '[server]/api/[user_id]/[opponent_id]/[app_name]/[room_id]/show_opponent_only_mic'
            },


        'opponent_mic_on':
            {
                'type': 'ajax',
                'name': 'opponent_mic_on',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/[room_id]/opponent_mic_on'
            },

        'opponent_mic_off':
            {
                'type': 'ajax',
                'name': 'opponent_mic_off',
                'url':  '[server]/api/[app_name]/[user_id]/[opponent_id]/[room_id]/opponent_mic_off'
            },

        'get_prices':
            {
                'type': 'ajax',
                'name': 'get_prices',
                'url':  '[server]/api/[app_name]/get_prices'
            },


        'set_prices':
            {
                'type': 'ajax',
                'name': 'get_prices',
                'url':  '[server]/api/[app_name]/set_prices'
            },



        'get_balance':
            {
                'type': 'outapi',
                'name': 'get_balance',
                'url':  '{{ tpa.get_balance_url }}'
            },


        'save_translation':
            {
                'type': 'ajax',
                'name': 'save_translation',
                'url':  '[server]/api/[app_name]/save_translation'
            },  
         




        }
    
}
