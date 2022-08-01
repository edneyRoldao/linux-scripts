echo "###################################################"
echo "### PY CHARM - install process has been started ###"
echo "###################################################"

echo "LOG - Downloading PyCharm 2022.1 community ..."
wget https://download.jetbrains.com/python/pycharm-community-2022.1.tar.gz
tar -xzf pycharm-community-2022.1.tar.gz
rm pycharm-community-2022.1.tar.gz

echo "LOG - installing pycharm into /opt/pycharm ..."
if [ -d "/opt/pycharm" ];then
	sudo rm -rf /opt/pycharm
fi
sudo mv pycharm-community-2022.1 /opt/pycharm

echo "LOG - Increasing the memory heap of the IDE on vmoptions Xms1024 and Xmx2048 ..."
sudo sed -i 's/Xms128m/Xms1024m/' /opt/pycharm/bin/pycharm64.vmoptions
sudo sed -i 's/Xmx750m/Xmx2048m/' /opt/pycharm/bin/pycharm64.vmoptions

echo "LOG - Creating symbolic link..."
if [ -L "/usr/bin/pycharm" ];then
    sudo rm -f /usr/bin/pycharm
fi
sudo ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm
sudo chmod +x /usr/bin/pycharm

echo "LOG - Creating desktop entry for pycharm"
if [ -L "/tmp/pycharm.desktop" ];then
    sudo rm -f /tmp/pycharm.desktop
fi
echo "[Desktop Entry]" >> pycharm.desktop
echo "Encoding=UTF-8" >> pycharm.desktop
echo "Name=pycharm IDEA" >> pycharm.desktop
echo "Exec=/opt/pycharm/bin/pycharm.sh" >> pycharm.desktop
echo "Icon=/opt/pycharm/bin/pycharm.png" >> pycharm.desktop
echo "Terminal=false" >> pycharm.desktop
echo "Type=Application" >> pycharm.desktop
echo "Categories=Development;" >> pycharm.desktop
echo "StartupNotify=true" >> pycharm.desktop
sudo mv pycharm.desktop ~/.local/share/applications

echo "LOG - pycharm install process finished"
