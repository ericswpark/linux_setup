#!/bin/bash

echo "Follow this URL to get the server package URL: https://www.minecraft.net/en-us/download/server/"
read -p "Enter Minecraft server package URL: " minecraft_url
read -p "Enter minimum RAM in MB (256 recommended, 32 for low RAM): " ram_minimum
read -p "Enter maximum RAM in MB (512 recommended, 256 for low RAM): " ram_maximum

echo "Starting installation of OpenJDK! Please input your sudo password below."
sudo apt install -y openjdk-11-jre-headless

echo "Creating Minecraft support files at the minecraft/ directory..."
mkdir minecraft
cd minecraft

echo "Downloading server binary... This may take a while!"
wget $minecraft_url -O minecraft_server.jar
echo "#!/bin/bash

RAM_MINIMUM = $ram_minimum
RAM_MAXIMUM = $ram_maximum

java -Xms'\$RAM_MINIMUM'm -Xmx'\$RAM_MAXIMUM'm -jar minecraft_server.jar -o true" > start.sh
chmod +x start.sh

echo "Minecraft setup done. Please transfer your save files."
echo "You can start the server by running the start.sh file."
echo "To change RAM values, edit the start.sh file and find the corresponding variables."
