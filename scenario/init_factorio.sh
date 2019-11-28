#!/bin/bash

read -p "Enter Factorio version: " factorio_version

sudo apt install xz-utils
wget -O factorio.tar https://www.factorio.com/get-download/$factorio_version/headless/linux64
tar -xvf factorio.tar
cd factorio
echo "./bin/x64/factorio --start-server-load-latest --server-settings ./config/server-settings.json" > start.sh
chmod +x start.sh
cd

echo "Factorio setup done. Please put in your save files in the factorio/ directory."
echo "You can start the server by running the start.sh file."