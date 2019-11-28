#!/bin/bash

read -p "Enter Minecraft server package URL: " minecraft_url
read -p "Enter minimum RAM in MB (256 recommended, 32 for low RAM): " ram_minimum
read -p "Enter maximum RAM in MB (512 recommended, 256 for low RAM): " ram_maximum

sudo apt install openjdk-8-jre-headless
mkdir minecraft
cd minecraft
wget $minecraft_url -O minecraft_server.jar
echo "#!/bin/sh

RAM_MINIMUM = $ram_minimum
RAM_MAXIMUM = $ram_maximum

java -Xms\$RAM_MINIMUM -Xmx\$RAM_MAXIMUM -jar minecraft_server.jar -o true" > start.sh
chmod +x start.sh

echo "Minecraft setup done. Please transfer your save files."
echo "You can start the server by running the start.sh file."
echo "To change RAM values, edit the start.sh file and find the corresponding variables."