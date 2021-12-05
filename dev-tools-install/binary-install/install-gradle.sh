echo "#################################################"
echo "### GRADLE - install process has been started ###"
echo "#################################################"

VERSION=7.3.1

echo "LOG - Downloading Gradle ${VERSION} community ..."
wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip
sudo unzip -d . gradle-${VERSION}-bin.zip
sudo rm -f gradle-${VERSION}-bin.zip

echo "LOG - installing gradle into /opt/gradle-${VERSION} ..."
if [ -d "/opt/gradle-${VERSION}" ];then
	sudo rm -rf /opt/gradle-${VERSION}
fi
sudo mv gradle-${VERSION} /opt/gradle-${VERSION}

echo "LOG - Setting up GRADLE_HOME environments for: Gradle ..."
echo " " >> ~/.bashrc
echo "# GRADLE environment config" >> ~/.bashrc
echo "GRADLE_HOME=/opt/gradle-${VERSION}" >> ~/.bashrc
echo "export GRADLE_HOME" >> ~/.bashrc
echo "PATH=\$PATH:\$GRADLE_HOME/bin" >> ~/.bashrc

echo "LOG - Gradle install process finished"

