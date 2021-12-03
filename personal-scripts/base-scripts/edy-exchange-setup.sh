echo "ssh keys exchange has been started"
git config --global user.name "edneyRoldao"
git config --global user.email "edneyroldao@gmail.com"
cd ~/.ssh/
rm id_rsa
rm id_rsa.pub
cp edy/id_rsa.pub ./
cp edy/id_rsa ./
echo "my ssh keys has been copied to .ssh folder"
echo "my settings.xml"
cd ~/.m2/
rm settings.xml
echo "my settings.xml finished"
