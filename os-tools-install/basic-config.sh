#!/bin/bash

echo "###################################################"
echo "### Operation System Scripts - has been started ###"
echo "###################################################"

cd /tmp || exit

echo "snap config"
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo apt -y install snapd

echo "Operation System Scripts finished..."

