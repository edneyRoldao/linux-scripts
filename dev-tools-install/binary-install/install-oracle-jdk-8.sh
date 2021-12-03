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

