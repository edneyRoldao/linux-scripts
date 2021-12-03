echo "ssh keys exchange has been started"
git config --global user.name "edneyRoldao"
git config --global user.email "edney.roldao@speedy.io"
cd ~/.ssh/
rm id_rsa
rm id_rsa.pub
cp speedy/id_rsa.pub ./
cp speedy/id_rsa ./
echo "speedy ssh keys has been copied to .ssh folder"
echo "add speedy settings.xml"
cd ~/.m2/
rm settings.xml
cp settings-speedy.xml settings.xml
echo "add speedy settings.xml finished"
