echo "########################################################"
echo "### GOOGLE CHROME - install process has been started ###"
echo "########################################################"

echo "Downloading Chrome ..."

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm -f google-chrome-stable_current_amd64.deb

echo "Chrome install process finished"

