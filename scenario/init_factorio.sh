#!/bin/bash

# Ask what Factorio version to install
read -p "Enter Factorio version: " factorio_version

# Required for extracting Factorio's curious tar format
sudo apt install xz-utils

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
echo "Factorio setup done. Please put in your save files in the factorio/ directory."
echo "You can start the server by running the start.sh file."
echo "To back up your server, run backup.sh."
