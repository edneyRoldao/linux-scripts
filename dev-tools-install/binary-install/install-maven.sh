echo "#######################################################"
echo "### APACHE MAVEN - install process has been started ###"
echo "#######################################################"

echo "LOG - Downloading Apache Maven 3.6.3 ..."
wget https://dlcdn.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xzf apache-maven-3.6.3-bin.tar.gz
rm apache-maven-3.6.3-bin.tar.gz

echo "installing Apache Maven into /opt/apache-maven-3.6.3 ..."
if [ -d "/opt/apache-maven-3.6.3" ];then
	sudo rm -rf /opt/apache-maven-3.6.3
fi
sudo mv apache-maven-3.6.3 /opt/apache-maven-3.6.3

echo "LOG - Setting up MAVEN_HOME, M2_HOME and M2 environments for: Maven ..."
echo " " >> ~/.bashrc
echo "# MAVEN environment config" >> ~/.bashrc
echo "M2_HOME=/opt/apache-maven-3.6.3" >> ~/.bashrc
echo "export M2_HOME" >> ~/.bashrc
echo "M2=\$M2_HOME/bin" >> ~/.bashrc
echo "export M2" >> ~/.bashrc
echo "PATH=\$PATH:\$M2" >> ~/.bashrc

echo "LOG - Apache Maven install process finished"

