#!/bin/bash

# Ask what Factorio version to install
read -p "[init_factorio.sh] Enter Factorio version: " factorio_version

# Required for extracting Factorio's curious tar format
if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
    # Debian-based distro detected
    echo "[init_factorio.sh] Detected a Debian-based distribution!"
    echo "[init_factorio.sh] Installing dependencies. Enter your sudo password below:"
    sudo apt install -y xz-utils
else
    # Unsupported configuration
    echo "[init_factorio.sh] Unsupported distribution detected."
    echo "[init_factorio.sh] Please install the equivalent of xz-utils on your distribution."
    echo "[init_factorio.sh] Execution will now continue..."
fi

# Fetch and unpack headless server
wget -O factorio.tar https://www.factorio.com/get-download/$factorio_version/headless/linux64
tar -xvf factorio.tar

# Enter directory
cd factorio

# Start-up script generation
echo "./bin/x64/factorio --start-server-load-latest --server-settings ./config/server-settings.json" > start.sh

# Backup script generation
echo "#!/bin/bash

date=\$(date '+%Y%m%d')

tar -czvf \"\$date\".tar.gz \\
    saves/ \\
    config/ \\
    achievements.dat \\
    config-path.cfg \\
    server-adminlist.json \\
    player-data.json \\
    start.sh

md5sum \"\$date\".tar.gz > \"\$date\".tar.gz.md5

echo \"Backup created!\"" > backup.sh

# Give executable permissions for both files
chmod +x start.sh
chmod +x backup.sh
cd

# Show result to user
echo "[init_factorio.sh] Factorio setup done. Please put in your save files in the factorio/ directory."
echo "[init_factorio.sh] You can start the server by running the start.sh file."
echo "[init_factorio.sh] To back up your server, run backup.sh."
