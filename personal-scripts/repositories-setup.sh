echo "##################################################################"
echo "Obs: PC must be restarted after initial config to run this process"
echo "##################################################################"
echo "##### Edney repositories and docker setup - has been started #####"
echo "##################################################################"

echo "--------------------------------------------------------------------------"
echo "LOG - Cloning personal projects"
cd ~/workspace/personal/java-projects
git clone git@github.com:edneyRoldao/spring-data-unit-tests-samples.git
git clone git@github.com:edneyRoldao/open-feign-tests.git
git clone git@github.com:edneyRoldao/rabbitmq-with-spring.git
cd ~/workspace/personal/node-projects
git clone git@github.com:edneyRoldao/aulas-modulo-1.git
git clone git@github.com:edneyRoldao/sdk-ecommerce.git
git clone git@github.com:edneyRoldao/shopping-list.git
cd ~/workspace/personal/other-projects
git clone git@github.com:edneyRoldao/linux-utils.git

echo "--------------------------------------------------------------------------"
echo "LOG - Iterative projects"
cd ~/workspace/java-projects
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-back-pedidos
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-back-admin
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-back-oauth
cd ~/workspace/other-projects
git clone git@ssh.dev.azure.com:v3/IterativeProjetos/RoadCard/rntrc-front

echo "--------------------------------------------------------------------------"
echo "LOG - Abastece-ai projects"
cd ~/workspace/java-projects
git clone git@gitlab.eai.com.br:project-grups/wallet/core.git
git clone git@gitlab.eai.com.br:project-grups/wallet/payment-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/backoffice-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/commons-lib-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/partner-services.git
git clone git@gitlab.eai.com.br:project-grups/wallet/ecommerce-service-provider.git
git clone git@gitlab.eai.com.br:project-grups/wallet/cashback-new.git
git clone git@gitlab.eai.com.br:project-grups/wallet/smaug.git
git clone git@gitlab.eai.com.br:project-grups/wallet/elephant.git
git clone git@gitlab.eai.com.br:project-grups/wallet/webhook.git
git clone git@gitlab.eai.com.br:project-grups/wallet/mercury.git
git clone git@gitlab.eai.com.br:project-grups/wallet/sauron.git
git clone git@gitlab.eai.com.br:project-grups/wallet/vtex-payment-provider.git
cd ~/workspace/node-projects
git clone git@gitlab.eai.com.br:project-grups/wallet/ecommerce-api-gateway.git
git clone git@gitlab.eai.com.br:project-grups/wallet/ecommerce-sdk.git
git clone git@gitlab.eai.com.br:project-grups/wallet/partner-api-gateway.git
git clone git@gitlab.eai.com.br:project-grups/wallet/mobile-api-gateway.git
git clone git@gitlab.eai.com.br:project-grups/wallet/backoffice-api-gateway.git
git clone git@gitlab.eai.com.br:project-grups/wallet/vtex-api-gateway.git
cd ~/workspace/other-projects
git clone git@gitlab.eai.com.br:project-grups/wallet/backoffice-frontend-admin.git

echo "--------------------------------------------------------------------------"
echo "LOG - Creating docker containers"
cd ~/workspace/docker
docker-compose up -d

echo "-----------------------------------------------------------------"
echo "LOG - Edney repositories and docker setup - has been finished ..."
