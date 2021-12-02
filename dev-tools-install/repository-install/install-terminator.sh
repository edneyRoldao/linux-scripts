#!/bin/bash

echo "terminator install process has been started"
cd /tmp || exit

sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator

echo "terminator install process finished"
