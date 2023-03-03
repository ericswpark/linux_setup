#!/bin/bash

# Install basic things
sudo pacman -S --noconfirm --needed htop vim

# Install ffmpegthumbs for video thumbnail previews in Dolphin
# (Don't forget to enable them in settings!)
sudo pacman -S --noconfirm --needed ffmpegthumbs

# Install KDE Plasma addons (for window switchers, etc.)
sudo pacman -S --noconfirm --needed kdeplasma-addons
