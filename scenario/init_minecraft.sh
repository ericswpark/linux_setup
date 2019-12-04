#!/bin/bash

# Pre-setup questions
echo "Downloading server component..."
echo "Note that you can choose between vanilla, Paper, Bukkit, Spigot, and other Minecraft Servers."
echo "To download vanilla, follow this URL: https://www.minecraft.net/en-us/download/server/"
echo "To download PaperMC, follow this URL: https://papermc.io/downloads"
echo "To find the download package, right-click on the URL or build number and click on Copy Link Address."
read -p "Enter Minecraft server package URL: " minecraft_url
read -p "Enter minimum RAM in MB (256 recommended, 32 for low RAM): " ram_minimum
read -p "Enter maximum RAM in MB (512 recommended, 256 for low RAM): " ram_maximum

# OpenJDK setup
echo "Starting installation of OpenJDK! Please input your sudo password below."
sudo apt install -y openjdk-11-jre-headless

# minecraft/ directory
echo "Creating Minecraft support files at the minecraft/ directory..."
mkdir minecraft
cd minecraft

# Server binary installation
echo "Downloading server binary... This may take a while!"
wget $minecraft_url -O minecraft_server.jar

# Start-up script
echo "#!/bin/bash

RAM_MINIMUM=$ram_minimum
RAM_MAXIMUM=$ram_maximum

java -Xms\"\$RAM_MINIMUM\"m -Xmx\"\$RAM_MAXIMUM\"m -jar minecraft_server.jar" > start.sh

# Permissions
chmod +x start.sh

# Display results to user
echo "Minecraft setup done. Please transfer your save files."
echo "You can start the server by running the start.sh file."
echo "To change RAM values, edit the start.sh file and find the corresponding variables."
echo "You may also need to agree to the Minecraft EULA by modifying the eula.txt file."
