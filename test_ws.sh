cd test
python runner.py -v
python -m tornado.testing test_ws
python -m tornado.testing test_ws_invite
python -m tornado.testing test_ws_online
