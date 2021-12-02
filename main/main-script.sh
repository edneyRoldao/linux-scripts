#!/bin/bash

echo "snap config"
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo apt install snapd
#!/bin/bash

echo "Docker and Docker compose install process has been started"

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
#!/bin/bash

echo "GIT install process has been started"

sudo apt update
sudo apt -y install git

echo "GIT install process finished"
#!/bin/bash

echo "VSCode install process has been started"
cd /tmp || exit

sudo apt update
sudo apt -y install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt -y install code

echo "VSCode install process finished"
#!/bin/bash

echo "Sublime install process has been started"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get -y install sublime-text

echo "Sublime install process finished"
#!/bin/bash

echo "terminator install process has been started"
cd /tmp || exit

sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get update
sudo apt-get -y install terminator

echo "terminator install process finished"
#!/bin/bash

echo "Opera install process has been started"
cd /tmp || exit

sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install opera-stable

echo "Opera install process finished"
#!/bin/bash

echo "Apache Maven install process has been started"
cd /tmp || exit

echo "Downloading Apache Maven 3.8.4 ..."
wget -q https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
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
#!/bin/bash

echo "Intellij install process has been started"
cd /tmp || exit

echo "Downloading intellij 2021.3 community ..."
wget -q https://download-cdn.jetbrains.com/idea/ideaIC-2021.3.tar.gz
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

echo "Intellij install process finished"#!/bin/bash

echo "OpenJDK 11 - install process has been started"
cd /tmp || exit

echo "Downloading OpenJDK 11 ..."
wget -q https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
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
#!/bin/bash

echo "NodeJS 14.17 - install process has been started"
cd /tmp || exit

echo "Downloading NodeJS 14.17.0 ..."
wget -q https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz
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
#!/bin/bash

echo "Postman install process has been started"
cd /tmp || exit

echo "Downloading Postman lastest ..."
wget -q https://dl.pstmn.io/download/latest/linux64
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

echo "Postman install process finished"#!/bin/bash

echo "Oracle JDK 8 - install process has been started"
cd /tmp || exit

echo "Downloading Oracle JDK 8 ..."
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
tar -xzf jdk-8u131-linux-x64.tar.gz
rm jdk-8u131-linux-x64.tar.gz

echo "Installing - Oracle JDK 8 - into /opt/oracle-jdk1.8.0_131 ..."
if [ -d "/opt/oracle-jdk1.8.0_131" ];then
	sudo rm -rf /opt/oracle-jdk1.8.0_131
fi
sudo mv jdk1.8.0_131 /opt/oracle-jdk1.8.0_131

#echo "Setting up JAVA_HOME environment for: Oracle JDK 8 ..."
#echo " " >> ~/.bashrc
#echo "# JDK environment config" >> ~/.bashrc
#echo "JAVA_HOME=/opt/oracle-jdk1.8.0_131" >> ~/.bashrc
#echo "export JAVA_HOME" >> ~/.bashrc
#echo "PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

echo "Oracle JDK 8 install process finished"
#!/bin/bash

echo "dbeaver-ce install process has been started"
cd /tmp || exit

echo "Downloading dbeaver-ce ..."

wget -q https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpgk -i dbeaver-ce_21.3.0_amd64.deb

echo "dbeaver-ce install process finished"
#!/bin/bash

echo "Chrome install process has been started"
cd /tmp || exit

echo "Downloading Chrome ..."

wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpgk -i google-chrome-stable_current_amd64.deb

echo "Chrome install process finished"
#!/bin/bash

echo "sportfy install process has been started"

sudo snap install sportfy --classic

echo "sportfy install process finished"
#!/bin/bash

echo "MySQL workbench install process has been started"

sudo snap install mysql-workbench-community

echo "MySQL workbench install process finished"
#!/bin/bash

echo "Robo3t install process has been started"

sudo snap install robo3t-snap

echo "Robo3t install process finished"
#!/bin/bash

echo "slack install process has been started"

sudo snap install slack --classic

echo "slack install process finished"
#!/bin/bash

echo "Sublime install process has been started"

sudo snap install sublime-text --classic

echo "Sublime install process finished"
#!/bin/bash

echo "skype install process has been started"

sudo snap install skype --classic

echo "skype install process finished"