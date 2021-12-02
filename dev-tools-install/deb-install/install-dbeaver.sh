#!/bin/bash

echo "dbeaver-ce install process has been started"
cd /tmp || exit

echo "Downloading dbeaver-ce ..."

wget -q https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpgk -i dbeaver-ce_21.3.0_amd64.deb

echo "dbeaver-ce install process finished"
