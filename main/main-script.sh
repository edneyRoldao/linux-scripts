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

echo "Installing SNAP ..."
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo apt -y install snapd

echo "Installing UNZIP"
sudo apt update
sudo apt -y install unzip


echo "Operation System Scripts finished..."

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

echo "Docker and Docker compose install process finished"

echo "##############################################"
echo "### GIT - install process has been started ###"
echo "##############################################"

sudo apt update
sudo apt -y install git

echo "GIT install process finished"

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

echo "##################################################"
echo "### SUBLIME - install process has been started ###"
echo "##################################################"

wget https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get -y install sublime-text

echo "Sublime install process finished"

echo "#####################################################"
echo "### TERMINATOR - install process has been started ###"
echo "#####################################################"

sudo apt update
sudo apt -y install terminator

echo "terminator install process finished"

echo "#######################################################"
echo "### APACHE MAVEN - install process has been started ###"
echo "#######################################################"

echo "Downloading Apache Maven 3.8.4 ..."
wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
tar -xzf apache-maven-3.8.4-bin.tar.gz
rm apache-maven-3.8.4-bin.tar.gz

echo "installing Apache Maven into /opt/apache-maven-3.8.4 ..."
if [ -d "/opt/apache-maven-3.8.4" ];then
	sudo rm -rf /opt/apache-maven-3.8.4
fi
sudo mv apache-maven-3.8.4 /opt/apache-maven-3.8.4

echo "Setting up MAVEN_HOME, M2_HOME and M2 environments for: Maven ..."
echo " " >> ~/.bashrc
echo "# MAVEN environment config" >> ~/.bashrc
echo "M2_HOME=/opt/apache-maven-3.8.4" >> ~/.bashrc
echo "export M2_HOME" >> ~/.bashrc
echo "M2=\$M2_HOME/bin" >> ~/.bashrc
echo "export M2" >> ~/.bashrc
echo "PATH=\$PATH:\$M2" >> ~/.bashrc

echo "Apache Maven install process finished"

echo "########################################################"
echo "### INTELLIJ IDEA - install process has been started ###"
echo "########################################################"

echo "Downloading intellij 2021.3 community ..."
wget https://download-cdn.jetbrains.com/idea/ideaIC-2021.3.tar.gz
tar -xzf ideaIC-2021.3.tar.gz
rm ideaIC-2021.3.tar.gz

echo "installing intellij into /opt/intellij ..."
if [ -d "/opt/intellij" ];then
	sudo rm -rf /opt/intellij
fi
sudo mv idea-IC-213.5744.223 /opt/intellij

echo "Creating symbolic link..."
if [ -L "/usr/bin/intellij" ];then
    sudo rm -f /usr/bin/idea
fi
sudo ln -s /opt/intellij/bin/idea.sh /usr/bin/idea
sudo chmod +x /usr/bin/idea

echo "Creating desktop entry for intellij"
if [ -L "/tmp/intellij.desktop" ];then
    sudo rm -f /tmp/intellij.desktop
fi
echo "[Desktop Entry]" >> intellij.desktop
echo "Encoding=UTF-8" >> intellij.desktop
echo "Name=Intellij IDEA" >> intellij.desktop
echo "Exec=/opt/intellij/bin/idea.sh" >> intellij.desktop
echo "Icon=/opt/intellij/bin/idea.png" >> intellij.desktop
echo "Terminal=false" >> intellij.desktop
echo "Type=Application" >> intellij.desktop
echo "Categories=Development;" >> intellij.desktop
echo "StartupNotify=true" >> intellij.desktop
sudo mv intellij.desktop ~/.local/share/applications

echo "Intellij install process finished"

echo "#################################################"
echo "### GRADLE - install process has been started ###"
echo "#################################################"

VERSION=7.3.1

echo "Downloading Gradle ${VERSION} community ..."
wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip
sudo unzip -d . gradle-${VERSION}-bin.zip
sudo rm -f gradle-${VERSION}-bin.zip

echo "installing gradle into /opt/gradle-${VERSION} ..."
if [ -d "/opt/gradle-${VERSION}" ];then
	sudo rm -rf /opt/gradle-${VERSION}
fi
sudo mv gradle-${VERSION} /opt/gradle-${VERSION}

echo "Setting up GRADLE_HOME environments for: Gradle ..."
echo " " >> ~/.bashrc
echo "# GRADLE environment config" >> ~/.bashrc
echo "GRADLE_HOME=/opt/gradle-${VERSION}" >> ~/.bashrc
echo "export GRADLE_HOME" >> ~/.bashrc
echo "PATH=\$PATH:\$GRADLE_HOME/bin" >> ~/.bashrc

echo "Gradle install process finished"

echo "######################################################"
echo "### OPEN_JDK 11 - install process has been started ###"
echo "######################################################"

echo "Downloading OpenJDK 11 ..."
wget https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
tar -xzf openjdk-11.0.1_linux-x64_bin.tar.gz
rm openjdk-11.0.1_linux-x64_bin.tar.gz

echo "Installing - OpenJDK 11 - into /opt/jdk-11.0.1 ..."
if [ -d "/opt/jdk-11.0.1" ];then
	sudo rm -rf /opt/jdk-11.0.1
fi
sudo mv jdk-11.0.1 /opt/jdk-11.0.1

echo "Setting up JAVA_HOME environment for: OpenJDK 11 ..."
echo " " >> ~/.bashrc
echo "# JDK environment config" >> ~/.bashrc
echo "JAVA_HOME=/opt/jdk-11.0.1" >> ~/.bashrc
echo "export JAVA_HOME" >> ~/.bashrc
echo "PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

echo "OpenJDK 11 - install process finished"

echo "##################################################"
echo "### NODE_JS - install process has been started ###"
echo "##################################################"

echo "Downloading NodeJS 14.17.0 ..."
wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz
tar -xzf node-v14.17.0-linux-x64.tar.gz
rm node-v14.17.0-linux-x64.tar.gz

echo "installing - NodeJS 14.17 - into /opt/node-14.17.0 ..."
if [ -d "/opt/node-14.17.0" ];then
	sudo rm -rf /opt/node-14.17.0
fi
sudo mv node-v14.17.0-linux-x64 /opt/node-14.17.0

echo "Setting up NODE_JS environment for: NodeJS 14.17 ..."
echo " " >> ~/.bashrc
echo "# NodeJS environment config" >> ~/.bashrc
echo "NODE_JS=/opt/node-14.17.0" >> ~/.bashrc
echo "export NODE_JS" >> ~/.bashrc
echo "PATH=\$PATH:\$NODE_JS/bin" >> ~/.bashrc

echo "NodeJS install process finished"

echo "##################################################"
echo "### POSTMAN - install process has been started ###"
echo "##################################################"

echo "Downloading Postman lastest ..."
wget https://dl.pstmn.io/download/latest/linux64
tar -xzf linux64
rm linux64

echo "Postman lastest into /opt/postman ..."
if [ -d "/opt/postman" ];then
	sudo rm -rf /opt/postman
fi
sudo mv Postman /opt/postman

echo "Creating symbolic link..."
if [ -L "/usr/bin/postman" ];then
    sudo rm -f /usr/bin/postman
fi
sudo ln -s /opt/postman/app/Postman /usr/bin/postman
sudo chmod +x /usr/bin/postman

echo "Creating desktop entry for Postman"
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

echo "Postman install process finished"

echo "#######################################################"
echo "### ORACLE_JDK 8 - install process has been started ###"
echo "#######################################################"

echo "Downloading Oracle JDK 8 ..."
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
tar -xzf jdk-8u131-linux-x64.tar.gz
rm jdk-8u131-linux-x64.tar.gz

echo "Installing - Oracle JDK 8 - into /opt/oracle-jdk1.8.0_131 ..."
if [ -d "/opt/oracle-jdk1.8.0_131" ];then
	sudo rm -rf /opt/oracle-jdk1.8.0_131
fi
sudo mv jdk1.8.0_131 /opt/oracle-jdk1.8.0_131

#echo "the following instructions were commented cause OpenJDK 11 will be the default JDK"
#echo "Setting up JAVA_HOME environment for: Oracle JDK 8 ..."
#echo " " >> ~/.bashrc
#echo "# JDK environment config" >> ~/.bashrc
#echo "JAVA_HOME=/opt/oracle-jdk1.8.0_131" >> ~/.bashrc
#echo "export JAVA_HOME" >> ~/.bashrc
#echo "PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

echo "Oracle JDK 8 install process finished"

echo "##################################################"
echo "### DBEAVER - install process has been started ###"
echo "##################################################"

echo "Downloading dbeaver-ce ..."

wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo rm -f dbeaver-ce_latest_amd64.deb

echo "dbeaver-ce install process finished"

echo "########################################################"
echo "### GOOGLE CHROME - install process has been started ###"
echo "########################################################"

echo "Downloading Chrome ..."

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm -f google-chrome-stable_current_amd64.deb

echo "Chrome install process finished"

echo "##################################################"
echo "### SPOTIFY - install process has been started ###"
echo "##################################################"

sudo snap install spotify

echo "spotify install process finished"

echo "###########################################################"
echo "### MY_SQL WORKBENCH - install process has been started ###"
echo "###########################################################"

sudo snap install mysql-workbench-community

echo "MySQL workbench install process finished"

echo "##################################################"
echo "### ROBO_3T - install process has been started ###"
echo "##################################################"

sudo snap install robo3t-snap

echo "Robo3t install process finished"

echo "################################################"
echo "### SLACK - install process has been started ###"
echo "################################################"

sudo snap install slack --classic

echo "slack install process finished"

echo "################################################"
echo "### SKYPE - install process has been started ###"
echo "################################################"

sudo snap install skype --classic

echo "skype install process finished"

echo "################################################"
echo "### OPERA - install process has been started ###"
echo "################################################"

sudo snap install opera

echo "opera install process finished"

echo "##########################################"
echo "##### MAIN SCRIPT - PROCESS FINISHED #####"
echo "##########################################"

echo "Creating ending file time log"
touch end-time-process-log.txt

echo "Just kidding"
xdg-open https://www.youtube.com/watch?v=o6DLmuibSVE&ab_channel=JasonVoorhees?autoplay=1

