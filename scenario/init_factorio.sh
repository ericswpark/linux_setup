#!/bin/bash

read -p "Enter Factorio version: " factorio_version

sudo apt install xz-utils
wget -O factorio.tar https://www.factorio.com/get-download/$factorio_version/headless/linux64
tar -xvf factorio.tar
cd factorio

# Start-up script
echo "./bin/x64/factorio --start-server-load-latest --server-settings ./config/server-settings.json" > start.sh

# Backup script
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

echo \"Backup created!\"" > backup.sh

# Give executable permissions for both files
chmod +x start.sh
chmod +x backup.sh
cd

echo "Factorio setup done. Please put in your save files in the factorio/ directory."
echo "You can start the server by running the start.sh file."
echo "To back up your server, run backup.sh."
