echo "###################################################"
echo "### Operation System Scripts - has been started ###"
echo "###################################################"

echo "Installing SNAP ..."
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo apt -y install snapd

echo "Installing UNZIP"
sudo apt update
sudo apt -y install unzip


echo "Operation System Scripts finished..."

