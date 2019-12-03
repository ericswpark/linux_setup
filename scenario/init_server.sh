#!/bin/bash

# Initial server setup for Debian 10

read -p "Enter username: " username

adduser $username
apt update
apt -y upgrade
apt install -y sudo
usermod -aG sudo $username
apt install -y tmux htop
cp -r ~/.ssh /home/$username
chown -R $username:$username /home/$username/.ssh

echo "Initial set up complete."
