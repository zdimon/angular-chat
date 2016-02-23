#!/bin/bash
kill $(lsof -t -i:8882)
kill $(lsof -t -i:8883)
kill $(lsof -t -i:8884)

