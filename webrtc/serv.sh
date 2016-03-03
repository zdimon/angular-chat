#!/bin/bash
kill $(lsof -t -i:8882)
python -m SimpleHTTPServer 8882
