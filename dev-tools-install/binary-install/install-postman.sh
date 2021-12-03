echo "##################################################"
echo "### POSTMAN - install process has been started ###"
echo "##################################################"

echo "Downloading Postman lastest ..."
wget https://dl.pstmn.io/download/latest/linux64
tar -xzf linux64
rm linux64

echo "Postman lastest into /opt/postman ..."
if [ -d "/opt/postman" ];then
	sudo rm -rf /opt/postman
fi
sudo mv Postman /opt/postman

echo "Creating symbolic link..."
if [ -L "/usr/bin/postman" ];then
    sudo rm -f /usr/bin/postman
fi
sudo ln -s /opt/postman/app/Postman /usr/bin/postman
sudo chmod +x /usr/bin/postman

echo "Creating desktop entry for Postman"
if [ -L "/tmp/postman.desktop" ];then
    sudo rm -f /tmp/postman.desktop
fi
echo "[Desktop Entry]" >> postman.desktop
echo "Encoding=UTF-8" >> postman.desktop
echo "Name=Postman" >> postman.desktop
echo "Exec=/opt/postman/app/Postman %U" >> postman.desktop
echo "Icon=/opt/postman/app/icons/icon_128x128.png" >> postman.desktop
echo "Terminal=false" >> postman.desktop
echo "Type=Application" >> postman.desktop
echo "Categories=Development;" >> postman.desktop
echo "StartupNotify=true" >> postman.desktop
sudo mv postman.desktop ~/.local/share/applications

echo "Postman install process finished"

