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

echo "###################################################"
echo "### Operation System Scripts - has been started ###"
echo "###################################################"

echo "--------------------------------------------------------"
echo "LOG - Installing SNAP ..."
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo apt -y install snapd

echo "--------------------------------------------------------"
echo "LOG - Installing UNZIP ..."
sudo apt update
sudo apt -y install unzip

echo "--------------------------------------------------------"
echo "LOG - Turning completion case insensitive ..."
if [ ! -a ~/.inputrc ];then 
    echo '$include /etc/inputrc' > ~/.inputrc;
fi
echo 'set completion-ignore-case On' >> ~/.inputrc

echo "###################################################"
echo "   Operation System Scripts -  HAS BEEN FINISHED   "
echo "###################################################"


echo "##################################################"
echo "### SPOTIFY - install process has been started ###"
echo "##################################################"

sudo snap install spotify

echo "spotify install process finished"

echo "##################################################"
echo "### SUBLIME - install process has been started ###"
echo "##################################################"

sudo snap install sublime-text --classic

echo "Sublime install process finished"

echo "##############################################"
echo "### GIT - install process has been started ###"
echo "##############################################"

sudo apt update
sudo apt -y install git

echo "GIT install process finished"

echo "##################################################"
echo "### SPOTIFY - install process has been started ###"
echo "##################################################"

sudo snap install discord

echo "spotify install process finished"

echo "######################################################"
echo "### DEFAULT JRE - install process has been started ###"
echo "######################################################"

sudo apt -y install default-jre

echo "DEFAULT JRE install process finished"

echo "##################################################"
echo "### NODE_JS - install process has been started ###"
echo "##################################################"

echo "LOG - Downloading NodeJS 14.17.0 ..."
wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz
tar -xzf node-v14.17.0-linux-x64.tar.gz
rm node-v14.17.0-linux-x64.tar.gz

echo "LOG - installing - NodeJS 14.17 - into /opt/node-14.17.0 ..."
if [ -d "/opt/node-14.17.0" ];then
	sudo rm -rf /opt/node-14.17.0
fi
sudo mv node-v14.17.0-linux-x64 /opt/node-14.17.0

echo "LOG - Setting up NODE_JS environment for: NodeJS 14.17 ..."
echo " " >> ~/.bashrc
echo "# NodeJS environment config" >> ~/.bashrc
echo "NODE_JS=/opt/node-14.17.0" >> ~/.bashrc
echo "export NODE_JS" >> ~/.bashrc
echo "PATH=\$PATH:\$NODE_JS/bin" >> ~/.bashrc

echo "LOG - NodeJS install process finished"

echo "###########################################################"
echo "### MY_SQL WORKBENCH - install process has been started ###"
echo "###########################################################"

sudo snap install mysql-workbench-community

echo "MySQL workbench install process finished"

echo "#############################################################"
echo "### VISUAL STUDIO CODE - install process has been started ###"
echo "#############################################################"

sudo apt update
sudo apt -y install software-properties-common apt-transport-https wget
wget https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt -y install code

echo "VSCode install process finished"

echo "####################################################################"
echo "### DOCKER and DOCKER_COMPOSE - install process has been started ###"
echo "####################################################################"

sudo apt-get -y remove docker docker-engine docker.io docker-compose containerd runc
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER
docker --version
docker-compose --version

echo "LOG - Docker and Docker compose install process finished"

echo "##################################################"
echo "### POSTMAN - install process has been started ###"
echo "##################################################"

echo "LOG - Downloading Postman lastest ..."
wget https://dl.pstmn.io/download/latest/linux64
tar -xzf linux64
rm linux64

echo "LOG - Postman lastest into /opt/postman ..."
if [ -d "/opt/postman" ];then
	sudo rm -rf /opt/postman
fi
sudo mv Postman /opt/postman

echo "LOG - Creating symbolic link..."
if [ -L "/usr/bin/postman" ];then
    sudo rm -f /usr/bin/postman
fi
sudo ln -s /opt/postman/app/Postman /usr/bin/postman
sudo chmod +x /usr/bin/postman

echo "LOG - Creating desktop entry for Postman"
if [ -L "/tmp/postman.desktop" ];then
    sudo rm -f /tmp/postman.desktop
fi
echo "[Desktop Entry]" >> postman.desktop
echo "Encoding=UTF-8" >> postman.desktop
echo "Name=Postman" >> postman.desktop
echo "Exec=/opt/postman/app/Postman %U" >> postman.desktop
echo "Icon=/opt/postman/app/icons/icon_128x128.png" >> postman.desktop
echo "Terminal=false" >> postman.desktop
echo "Type=Application" >> postman.desktop
echo "Categories=Development;" >> postman.desktop
echo "StartupNotify=true" >> postman.desktop
sudo mv postman.desktop ~/.local/share/applications

echo "LOG - Postman install process finished"

echo "################################################"
echo "### SKYPE - install process has been started ###"
echo "################################################"

sudo snap install skype --classic

echo "skype install process finished"

echo "######################################################"
echo "### OPEN_JDK 11 - install process has been started ###"
echo "######################################################"

echo "LOG - Downloading OpenJDK 11 ..."
echo "LOG - Once and a while this step takes a long time."
wget https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
tar -xzf openjdk-11.0.1_linux-x64_bin.tar.gz
rm openjdk-11.0.1_linux-x64_bin.tar.gz

echo "LOG - Installing - OpenJDK 11 - into /opt/jdk-11.0.1 ..."
if [ -d "/opt/jdk-11.0.1" ];then
	sudo rm -rf /opt/jdk-11.0.1
fi
sudo mv jdk-11.0.1 /opt/jdk-11.0.1

echo "LOG - Setting up JAVA_HOME environment for: OpenJDK 11 ..."
echo " " >> ~/.bashrc
echo "# JDK environment config" >> ~/.bashrc
echo "JAVA_HOME=/opt/jdk-11.0.1" >> ~/.bashrc
echo "export JAVA_HOME" >> ~/.bashrc
echo "PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

echo "LOG - OpenJDK 11 - install process finished"

echo "########################################################"
echo "### GOOGLE CHROME - install process has been started ###"
echo "########################################################"

echo "LOG - Downloading Chrome ..."

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm -f google-chrome-stable_current_amd64.deb

echo "LOG - Chrome install process finished"

echo "#####################################################"
echo "### TERMINATOR - install process has been started ###"
echo "#####################################################"

sudo apt update
sudo apt -y install terminator

echo "terminator install process finished"

echo "##########################################"
echo "##### MAIN SCRIPT - PROCESS FINISHED #####"
echo "##########################################"

echo "Moving to temporary directory"
cd /tmp || exit

echo "Creating ending file time log"
touch end-time-process-log.txt

echo "-----------------------------------------------"
echo "-----------------------------------------------"
echo ""
echo "  ***** ALL PROCESSES HAS BEEN FINISHED *****  "
echo ""
echo "-----------------------------------------------"
echo "-----------------------------------------------"

