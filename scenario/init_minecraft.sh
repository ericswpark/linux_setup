#!/bin/bash

read -p "Enter Minecraft server package URL: " minecraft_url
read -p "Enter minimum RAM in MB (256 recommended, 32 for low RAM): " ram_minimum
read -p "Enter maximum RAM in MB (512 recommended, 256 for low RAM): " ram_maximum

sudo apt install openjdk-8-jre-headless screen
mkdir minecraft
cd minecraft
wget $minecraft_url -O minecraft_server.jar
echo "#!/bin/sh

java -Xms$ram_minimum -Xmx$ram_maximum -jar minecraft_server.jar -o true" > start.sh
chmod +x start.sh

echo "Minecraft setup done. Please transfer your save files."
echo "You can start the server by running the start.sh file."