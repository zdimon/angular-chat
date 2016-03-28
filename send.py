import tornadoredis
import json
print 'conecting'
redis_client = tornadoredis.Client(host='localhost', port=6379)
print 'sending'
#redis_client.publish('333',json.dumps({'mess':'hello', 'action': 'send_message333'}))

mes = '["put_me_in_room", {"contact_id": "150045", "source": "views/room.py", "contact": {"city": "Kherson", "user_id": 150045, "name": "Vladik", "gender": "m", "image": "http://brides.mirbu.com/Media/images/users/small/5ae0efeaf9c1be75bde460bb89ce79ea.jpg", "is_online": 1, "is_invisible": false, "is_invitation_enabled": true, "id": 46, "culture": null, "birthday": "1994-05-08", "activity": 1459170327, "country": "Ukraine", "age": "21", "profile_url": "/man/profile/150045", "is_camera_active": false}, "room_id": "639", "action": "put_me_in_room", "contact_data": {}, "owner_id": "150032"}]'

redis_client.publish('tpa1com_150032',mes)



