echo "####################################################################"
echo "### DOCKER and DOCKER_COMPOSE - install process has been started ###"
echo "####################################################################"

sudo apt-get -y remove docker docker-engine docker.io docker-compose containerd runc
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER
docker --version
docker-compose --version

echo "LOG - Docker and Docker compose install process finished"

