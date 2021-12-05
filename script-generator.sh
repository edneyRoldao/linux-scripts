#!/bin/bash

echo "Main script generation process has been started ..."
# Merging script
# Merging all scripts so that we can run all scripts once.

echo "Removing previous main-script.sh"
if [ -d "/main" ];then
	sudo rm -rf /main
fi

echo "Merging all OS scritps"
find ./os-tools-install -type f -name '*.sh' -exec cat {} + > all-os-scripts.sh

echo "Merging all Dev scritps"
find ./dev-tools-install -type f -name '*.sh' -exec cat {} + > all-dev-scripts.sh

echo "Merging OS and DEV scripts"
cat init-script-log.sh all-os-scripts.sh all-dev-scripts.sh personal-scripts/setup.sh end-script-log.sh > main-script.sh

echo "Moving main-script"
mkdir main
mv main-script.sh main/

echo "Giving exec permission to main-script file"
chmod +x main/main-script.sh

echo "Removing temp files"
rm -f all-os-scripts.sh
rm -f all-dev-scripts.sh

echo "Main script has been generated at: main/main-script.sh"
