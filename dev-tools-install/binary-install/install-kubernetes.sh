echo "#####################################################"
echo "### Kubernetes - install process has been started ###"
echo "#####################################################"

echo "### Installing Minikube ###"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "### Minikube has been installed ###"

echo "### Installing kubectl ###"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "### kubectl has been installed ###"
