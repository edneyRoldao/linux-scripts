echo "ssh keys exchange has been started"
git config --global user.name "edneyRoldao"
git config --global user.email "edney.souza.ext@ipiranga.ipiranga"
cd ~/.ssh/
rm id_rsa
rm id_rsa.pub
cp ipiranga/id_rsa.pub ./
cp ipiranga/id_rsa ./
echo "ipiranga ssh keys has been copied to .ssh folder"
echo "add ipiranga settings.xml"
cd ~/.m2/
rm settings.xml
echo "add ipiranga settings.xml finished"
