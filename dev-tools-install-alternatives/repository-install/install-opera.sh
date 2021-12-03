echo "################################################"
echo "### OPERA - install process has been started ###"
echo "################################################"

sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install opera-stable

echo "Opera install process finished"

