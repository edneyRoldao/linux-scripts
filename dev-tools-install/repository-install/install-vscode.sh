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

