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
)
sudo pacman -S --noconfirm --needed "${PROGRAMS[@]}"

