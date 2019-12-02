#!/bin/bash

# This script sets up a game server from scratch.
# Will go through Factorio setup and Minecraft setup

# Factorio setup (comment this if you don't want Factorio)
bash <(curl -s https://raw.githubusercontent.com/ideaman924/linux_setup/master/scenario/init_factorio.sh)

# Minecraft setup (comment this if you don't want Minecraft)
bash <(curl -s https://raw.githubusercontent.com/ideaman924/linux_setup/master/scenario/init_minecraft.sh)
