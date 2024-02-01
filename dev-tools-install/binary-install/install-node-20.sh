echo "##################################################"
echo "### NODE_JS 20 - install process has been started ###"
echo "##################################################"

echo "LOG - Downloading NodeJS 20.11.0 ..."
wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.gz
tar -xzf node-v20.11.0-linux-x64.tar.gz
rm node-v20.11.0-linux-x64.tar.gz

if [ -d "/opt/node-20.11.0" ];then
	sudo rm -rf /opt/node-20.11.0
fi
sudo mv node-v20.11.0-linux-x64 /opt/node-20.11.0

echo "LOG - NodeJS 16 install process finished"
