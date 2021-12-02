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
