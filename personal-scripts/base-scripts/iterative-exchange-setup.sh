echo "ssh keys exchange has been started"
git config --global user.name "edneyRoldao"
git config --global user.email "edney.souza@iterative.com.br"
cd ~/.ssh/
rm id_rsa
rm id_rsa.pub
cp iterative/id_rsa.pub ./
cp iterative/id_rsa ./
echo "iterative ssh keys has been copied to .ssh folder"
echo "add iterative settings.xml"
cd ~/.m2/
rm settings.xml
echo "add iterative settings.xml finished"
