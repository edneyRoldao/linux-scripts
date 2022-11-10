echo "##########################################################################"
echo "##### Edney development environment initial setup - has been started #####"
echo "##########################################################################"

echo "--------------------------------------------------------------------------"
echo "LOG - Setting up git global config ..."
git config --global user.name "edneyRoldao"
git config --global user.email "edneyroldao@gmail.com"

echo "--------------------------------------------------------------------------"
echo "LOG - creating folders..."
mkdir ~/workspace
mkdir ~/workspace/docker
mkdir ~/workspace/shell-Scripts
mkdir ~/workspace/iterative
mkdir ~/workspace/iterative/files
mkdir ~/workspace/abasteceai
mkdir ~/workspace/abasteceai/files
mkdir ~/workspace/abasteceai/database
mkdir ~/workspace/abasteceai/database/local
mkdir ~/workspace/abasteceai/database/local/dumps
mkdir ~/workspace/commons-files
mkdir ~/workspace/java-projects
mkdir ~/workspace/node-projects
mkdir ~/workspace/other-projects
mkdir ~/workspace/personal
mkdir ~/workspace/personal/files
mkdir ~/workspace/personal/java-projects
mkdir ~/workspace/personal/node-projects
mkdir ~/workspace/personal/other-projects

echo "--------------------------------------------------------------------------"
echo "LOG - Downloading util scripts, Moving and giving exec permission"
curl -o abasteceai-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/abasteceai-exchange-setup.sh
curl -o db-import-abasteceai-local.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/db-import-abasteceai-local.sh
curl -o docker-start.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/docker-start.sh
curl -o edy-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/edy-exchange-setup.sh
curl -o iterative-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/iterative-exchange-setup.sh
curl -o jdk8-exchange.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/jdk8-exchange.sh
curl -o jdk11-exchange.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/jdk11-exchange.sh

mv *.sh ~/workspace/shell-Scripts
sudo chmod +x ~/workspace/shell-Scripts/*.sh

echo "--------------------------------------------------------------------------"
echo "LOG - Adding script files to path"
echo " " >> ~/.bashrc
echo "# Scripts Utils config" >> ~/.bashrc
echo "PATH=\$PATH:~/workspace/shell-Scripts" >> ~/.bashrc

echo "--------------------------------------------------------------------------"
echo "LOG - Downloading docker-compose"
cd ~/workspace/docker
curl -o docker-compose.yml https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/dev-tools-install/docker-compose-base/docker-compose.yml

echo "--------------------------------------------------------------------------"
echo "LOG - Downloading abasteceai files"
cd ~/workspace/abasteceai/files
curl -o settings.xml https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/files-abasteceai/settings.xml
curl -o eai-bifrost-dev.pem https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/files-abasteceai/eai-bifrost-dev.pem
curl -o aws-vpn-client-config.ovpn https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/files-abasteceai/aws-vpn-client-config.ovpn

echo "--------------------------------------------------------------------------"
echo "LOG - Downloading iterative files"
cd ~/workspace/iterative/files
curl -o IterativePFsense-UDP4-1194-ca.crt https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/files-iterative/IterativePFsense-UDP4-1194-ca.crt
curl -o IterativePFsense-UDP4-1194-config.ovpn https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/files-iterative/IterativePFsense-UDP4-1194-config.ovpn
curl -o IterativePFsense-UDP4-1194-tls.key https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/files-iterative/IterativePFsense-UDP4-1194-tls.key

echo "--------------------------------------------------------------------------"
echo "LOG - Installing nodemon"
npm install --global nodemon

echo "--------------------------------------------------------------------------"
echo "LOG - Installing nodemon"
npm install --global yarn

echo "--------------------------------------------------------------------------"
echo "Restart PC to run the second script"
echo "LOG - Edney development environment initial setup - has been finished"
