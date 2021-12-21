echo "#########################################################"
echo "### AWS VPN CLIENT - install process has been started ###"
echo "#########################################################"

echo "LOG - adding apt-key"
wget -q -O - https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo/awsvpnclient_public_key.asc | sudo apt-key add -

echo "LOG - adding to repo to /etc/apt/sources.list.d/aws-vpn-client.list"
echo "deb [arch=amd64] https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo ubuntu-20.04 main" | sudo tee /etc/apt/sources.list.d/aws-vpn-client.list

echo "updating apt-get"
sudo apt-get update

echo "LOG - installing client"
sudo apt-get install awsvpnclient

echo "#########################################################"
echo "#### LOG - AWS VPN CLIENT - install process finished ####"
echo "#########################################################"
