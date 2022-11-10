echo "#####################################################"
echo "### Kubernetes - install process has been started ###"
echo "#####################################################"

echo "### Installing Minikube ###"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "### Minikube has been installed ###"

echo "### Installing Kind ###"
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.14.0/kind-$(uname)-amd64"
sudo chmod +x ./kind
sudo mkdir /opt/cluster_kind
sudo mv ./kind /opt/cluster_kind/kind
echo "LOG - Add Kind to path ..."
echo " " >> ~/.bashrc
echo "# Kubernetes Kind config" >> ~/.bashrc
echo "KUBE_KIND=/opt/cluster_kind" >> ~/.bashrc
echo "export KUBE_KIND" >> ~/.bashrc
echo "PATH=\$PATH:\$KUBE_KIND" >> ~/.bashrc
echo "### kind has been installed ###"


echo "### Installing kubectl ###"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "### kubectl has been installed ###"
