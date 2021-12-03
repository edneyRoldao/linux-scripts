echo "########################################################"
echo "### GOOGLE CHROME - install process has been started ###"
echo "########################################################"

echo "Downloading Chrome ..."

wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpgk -i google-chrome-stable_current_amd64.deb

echo "Chrome install process finished"

