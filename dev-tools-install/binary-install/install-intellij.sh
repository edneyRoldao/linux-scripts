echo "########################################################"
echo "### INTELLIJ IDEA - install process has been started ###"
echo "########################################################"

echo "Downloading intellij 2021.3 community ..."
wget https://download-cdn.jetbrains.com/idea/ideaIC-2021.3.tar.gz
tar -xzf ideaIC-2021.3.tar.gz
rm ideaIC-2021.3.tar.gz

echo "installing intellij into /opt/intellij ..."
if [ -d "/opt/intellij" ];then
	sudo rm -rf /opt/intellij
fi
sudo mv idea-IC-213.5744.223 /opt/intellij

echo "Creating symbolic link..."
if [ -L "/usr/bin/intellij" ];then
    sudo rm -f /usr/bin/idea
fi
sudo ln -s /opt/intellij/bin/idea.sh /usr/bin/idea
sudo chmod +x /usr/bin/idea

echo "Creating desktop entry for intellij"
if [ -L "/tmp/intellij.desktop" ];then
    sudo rm -f /tmp/intellij.desktop
fi
echo "[Desktop Entry]" >> intellij.desktop
echo "Encoding=UTF-8" >> intellij.desktop
echo "Name=Intellij IDEA" >> intellij.desktop
echo "Exec=/opt/intellij/bin/idea.sh" >> intellij.desktop
echo "Icon=/opt/intellij/bin/idea.png" >> intellij.desktop
echo "Terminal=false" >> intellij.desktop
echo "Type=Application" >> intellij.desktop
echo "Categories=Development;" >> intellij.desktop
echo "StartupNotify=true" >> intellij.desktop
sudo mv intellij.desktop ~/.local/share/applications

echo "Intellij install process finished"

