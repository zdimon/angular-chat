#!/bin/bash
echo 'Restart!!'
kill $(lsof -t -i:8882)
sleep 5
echo 'Restart!!'
kill $(lsof -t -i:8883)
sleep 5
echo 'Restart!!'
kill $(lsof -t -i:8884)
echo 'Restart!!'
kill $(lsof -t -i:5555)

