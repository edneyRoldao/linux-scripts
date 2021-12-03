#!/bin/bash

echo "##########################################"
echo "##### MAIN SCRIPT - has been started #####"
echo "##########################################"

echo "Moving to temporary directory"
cd /tmp || exit

echo "removing old time-lapsed log files"
rm -f init-time-process-log.txt
rm -f end-time-process-log.txt

echo "Creating init file time log"
touch init-time-process-log.txt

