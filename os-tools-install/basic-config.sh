echo "###################################################"
echo "### Operation System Scripts - has been started ###"
echo "###################################################"

echo "--------------------------------------------------------"
echo "LOG - Installing SNAP ..."
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update
sudo apt -y install snapd

echo "--------------------------------------------------------"
echo "LOG - Installing UNZIP ..."
sudo apt update
sudo apt -y install unzip

echo "--------------------------------------------------------"
echo "LOG - Turning completion case insensitive ..."
if [ ! -a ~/.inputrc ];then 
    echo '$include /etc/inputrc' > ~/.inputrc;
fi
echo 'set completion-ignore-case On' >> ~/.inputrc

echo "###################################################"
echo "   Operation System Scripts -  HAS BEEN FINISHED   "
echo "###################################################"


