#!/bin/bash

echo "##########################################################################"
echo "##### Edney development environment initial setup - has been started #####"
echo "##########################################################################"

echo "Creating Folders"
mkdir ~/.m2
mkdir ~/.ssh
mkdir ~/.ssh/edy
mkdir ~/.ssh/ipiranga
mkdir ~/.ssh/iterative
mkdir ~/workspace
mkdir ~/workspace/docker
mkdir ~/workspace/shell-Scripts
mkdir ~/workspace/iterative
mkdir ~/workspace/abasteceai
mkdir ~/workspace/speedy
mkdir ~/workspace/commons-files
mkdir ~/workspace/java-projects
mkdir ~/workspace/javascript-projects
mkdir ~/workspace/angular-projects
mkdir ~/workspace/personal
mkdir ~/workspace/personal/java-projects
mkdir ~/workspace/personal/node-projects
mkdir ~/workspace/personal/angular-projects

echo "Downloading scripts, Moving and giving exec permissions"
curl -o edy-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/main/main-script.sh
curl -o ipiranga-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/main/main-script.sh
curl -o iterative-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/main/main-script.sh
curl -o speedy-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/main/main-script.sh
curl -o docker-start.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/main/main-script.sh
mv *exchange-setup*.sh ~/workspace/shell-Scripts
mv docker-start.sh ~/workspace/shell-Scripts
sudo chmod +x ~/workspace/shell-Scripts/*.sh

echo "Adding script files to path"
echo " " >> ~/.bashrc
echo "# Scripts Utils config" >> ~/.bashrc
echo "PATH=\$PATH:~/workspace/shell-Scripts" >> ~/.bashrc

