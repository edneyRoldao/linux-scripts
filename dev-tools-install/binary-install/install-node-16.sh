echo "##################################################"
echo "### NODE_JS 16 - install process has been started ###"
echo "##################################################"

echo "LOG - Downloading NodeJS 16.19.0 ..."
wget https://nodejs.org/dist/latest-v16.x/node-v16.19.0-linux-x64.tar.gz
tar -xzf node-v16.19.0-linux-x64.tar.gz
rm node-v16.19.0-linux-x64.tar.gz

echo "LOG - installing - NodeJS 16.19 - into /opt/node-16.19.0 ..."
if [ -d "/opt/node-16.19.0" ];then
	sudo rm -rf /opt/node-16.19.0
fi
sudo mv node-v16.19.0-linux-x64 /opt/node-16.19.0

# echo "LOG - Setting up NODE_JS environment for: NodeJS 14.17 ..."
# echo " " >> ~/.bashrc
# echo "# NodeJS environment config" >> ~/.bashrc
# echo "NODE_JS=/opt/node-14.17.0" >> ~/.bashrc
# echo "export NODE_JS" >> ~/.bashrc
# echo "PATH=\$PATH:\$NODE_JS/bin" >> ~/.bashrc

echo "LOG - NodeJS 16 install process finished"
