#!/bin/bash

echo "terminator install process has been started"
cd /tmp || exit

sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get update
sudo apt-get -y install terminator

echo "terminator install process finished"
