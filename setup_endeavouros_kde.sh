#!/usr/bin/env bash

# Install applications I need
PROGRAMS=(
  # Utilities
  btop tailscale
  # Editors
  neovim zeditor
  # Media
  mpv
  # Authentication
  bitwarden
  # Study
  obsidian
  # Social
  discord
)
sudo pacman -S --noconfirm --needed "${PROGRAMS[@]}"

