echo "######################################################"
echo "### OPEN_JDK 17 - install process has been started ###"
echo "######################################################"

echo "LOG - Downloading OpenJDK 17 ..."
echo "LOG - Once and a while this step takes a long time."
wget https://download.oracle.com/java/17/archive/jdk-17.0.1_linux-x64_bin.tar.gz
tar -xzf jdk-17.0.1_linux-x64_bin.tar.gz
rm jdk-17.0.1_linux-x64_bin.tar.gz

echo "LOG - Installing - OpenJDK 17 - into /opt/jdk-17.0.1 ..."
if [ -d "/opt/jdk-17.0.1" ];then
	sudo rm -rf /opt/jdk-17.0.1
fi
sudo mv jdk-17.0.1 /opt/jdk-17.0.1

# echo "LOG - Setting up JAVA_HOME environment for: OpenJDK 17 ..."
# echo " " >> ~/.bashrc
# echo "# JDK environment config" >> ~/.bashrc
# echo "JAVA_HOME=/opt/jdk-17.0.1" >> ~/.bashrc
# echo "export JAVA_HOME" >> ~/.bashrc
# echo "PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

echo "LOG - OpenJDK 17 - install process finished"

