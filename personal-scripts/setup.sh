#!/bin/bash

echo "##########################################################################"
echo "##### Edney development environment initial setup - has been started #####"
echo "##########################################################################"

echo "Creating Folders"
mkdir ~/.m2
mkdir ~/.ssh
mkdir ~/.ssh/edy
mkdir ~/.ssh/ipiranga
mkdir ~/.ssh/iterative
mkdir ~/workspace
mkdir ~/workspace/docker
mkdir ~/workspace/shell-Scripts
mkdir ~/workspace/iterative
mkdir ~/workspace/abasteceai
mkdir ~/workspace/speedy
mkdir ~/workspace/commons-files
mkdir ~/workspace/java-projects
mkdir ~/workspace/javascript-projects
mkdir ~/workspace/personal
mkdir ~/workspace/personal/java-projects
mkdir ~/workspace/personal/javascript-projects

echo "Downloading scripts, Moving and giving exec permissions"
curl -o edy-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/edy-exchange-setup.sh
curl -o ipiranga-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/ipiranga-exchange-setup.sh
curl -o iterative-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/iterative-exchange-setup.sh
curl -o speedy-exchange-setup.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/speedy-exchange-setup.sh
curl -o docker-start.sh https://raw.githubusercontent.com/edneyRoldao/linux-utils/main/personal-scripts/base-scripts/docker-start.sh
mv *exchange-setup*.sh ~/workspace/shell-Scripts
mv docker-start.sh ~/workspace/shell-Scripts
sudo chmod +x ~/workspace/shell-Scripts/*.sh

echo "Adding script files to path"
echo " " >> ~/.bashrc
echo "# Scripts Utils config" >> ~/.bashrc
echo "PATH=\$PATH:~/workspace/shell-Scripts" >> ~/.bashrc

echo "Cloning personal projects"
~/workspace/scripts/edy-ssh-key-script.sh
cd ~/workspace/personal/java-projects
git clone git@github.com:edneyRoldao/spring-data-unit-tests-samples.git
git clone git@github.com:edneyRoldao/open-feign-tests.git
git clone git@github.com:edneyRoldao/rabbitmq-with-spring.git
cd ~/workspace/personal/javascript-projects
git clone git@github.com:edneyRoldao/aulas-modulo-1.git
git clone git@github.com:edneyRoldao/sdk-ecommerce.git

echo "Iterative projects"
~/workspace/scripts/iterative-exchange-setup.sh
cd ~/workspace/java-projects
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-back-pedidos
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-back-admin
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-back-oauth
cd ~/workspace/javascript-projects
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-front

echo "Abastece-ai projects"
~/workspace/scripts/ipiranga-exchange-setup.sh
cd ~/workspace/java-projects
git clone git@gitlab.eai.com.br:project-grups/wallet/core.git
git clone git@gitlab.eai.com.br:project-grups/wallet/payment-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/backoffice-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/commons-lib-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/partner-services.git
git clone git@gitlab.eai.com.br:project-grups/wallet/ecommerce-service-provider.git
cd ~/workspace/javascript-projects
git clone git@gitlab.eai.com.br:project-grups/wallet/ecommerce-api-gateway.git
git clone git@gitlab.eai.com.br:project-grups/wallet/ecommerce-sdk.git
git clone git@gitlab.eai.com.br:project-grups/wallet/partner-api-gateway.git
git clone git@gitlab.eai.com.br:project-grups/wallet/mobile-api-gateway.git
