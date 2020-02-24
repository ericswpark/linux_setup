#!/bin/bash

# Pre-setup questions
echo "[init_minecraft.sh] Downloading server component..."
echo "[init_minecraft.sh] Note that you can choose between vanilla, Paper, Bukkit, Spigot, and other Minecraft Servers."
echo "[init_minecraft.sh] To download vanilla, follow this URL: https://www.minecraft.net/en-us/download/server/"
echo "[init_minecraft.sh] To download PaperMC, follow this URL: https://papermc.io/downloads"
echo "[init_minecraft.sh] To find the download package, right-click on the URL or build number and click on Copy Link Address."
read -p "[init_minecraft.sh] Enter Minecraft server package URL: " minecraft_url
read -p "[init_minecraft.sh] Enter minimum RAM in MB (256 recommended, 32 for low RAM): " ram_minimum
read -p "[init_minecraft.sh] Enter maximum RAM in MB (512 recommended, 256 for low RAM): " ram_maximum

echo "[init_minecraft.sh] Cool, starting installation!"

# OpenJDK setup
if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
    # Debian-based distro detected
    echo "[init_minecraft.sh] Detected a Debian-based distribution!"
    echo "[init_minecraft.sh] Starting installation of OpenJDK! Please input your sudo password below."
    sudo apt install -y openjdk-11-jre-headless
else
    # Unsupported configuration
    echo "[init_minecraft.sh] Unsupported distribution detected."
    echo "[init_minecraft.sh] Please install the equivalent of OpenJDK's headless JRE on your distribution."
    echo "[init_minecraft.sh] For Arch-based distributions, install jre-openjdk-headless."
    echo "[init_minecraft.sh] Execution will now continue..."
fi

# minecraft/ directory
echo "[init_minecraft.sh] Creating Minecraft support files at the minecraft/ directory..."
mkdir minecraft
cd minecraft

# Server binary installation
echo "[init_minecraft.sh] Downloading server binary... This may take a while!"
wget $minecraft_url -O minecraft_server.jar

# Start-up script
echo "#!/bin/bash

RAM_MINIMUM=$ram_minimum
RAM_MAXIMUM=$ram_maximum

java -Xms\"\$RAM_MINIMUM\"m -Xmx\"\$RAM_MAXIMUM\"m -jar minecraft_server.jar" > start.sh

# Permissions
chmod +x start.sh

# Display results to user
echo "[init_minecraft.sh] Minecraft setup done. Please transfer your save files."
echo "[init_minecraft.sh] You can start the server by running the start.sh file."
echo "[init_minecraft.sh] To change RAM values, edit the start.sh file and find the corresponding variables."
echo "[init_minecraft.sh] You may also need to agree to the Minecraft EULA by modifying the eula.txt file."
