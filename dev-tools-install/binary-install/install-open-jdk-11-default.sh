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

