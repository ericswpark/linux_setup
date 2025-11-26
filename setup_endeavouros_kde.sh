#!/usr/bin/env bash

set -euo pipefail

# Install applications I need
PROGRAMS=(
  # Utilities
  btop tailscale git
  # Editors
  neovim zed
  # Media
  mpv
  # Authentication
  bitwarden
  # Study
  obsidian
  # Social
  discord
  # Email
  thunderbird
)
sudo pacman -S --noconfirm --needed "${PROGRAMS[@]}"


# Set up git
git config --global user.email "me@ericswpark.com"
git config --global user.name "Eric Park"

# Install programs from AUR
AUR_PROGRAMS=(
  # Study
  kuro-bin
)
yay -S --noconfirm --needed "${AUR_PROGRAMS[@]}"
