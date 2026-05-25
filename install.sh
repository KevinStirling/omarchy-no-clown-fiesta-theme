#!/usr/bin/env bash

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# THEME_DIR="$HOME/.config/omarchy/themes/no_clown_fiesta"

# Respect NVIM_APPNAME if set, otherwise fall back to default
NVIM_APPNAME="${NVIM_APPNAME:-nvim}"
NVIM_CONFIG="$HOME/.config/$NVIM_APPNAME"

detect_nvim_setup() {
  if [ -d "$NVIM_CONFIG/nvim-pack-lock.json" ] || [ -f "$NVIM_CONFIG/lazy-lock.json" ]; then
    echo "lazyvim"
  else
    echo "pack"
  fi
}

SETUP=$(detect_nvim_setup)

echo "Using Neovim config at: $NVIM_CONFIG"

case "$SETUP" in
  lazyvim)
    echo "Detected LazyVim — installing neovim/lazyvim.lua"
    ln -sf "$THEME_DIR/neovim/lazyvim.lua" "neovim.lua"
    ;;
  pack)
    echo "Detected vim.pack — installing neovim/pack.lua"
    ln -sf "$THEME_DIR/neovim/pack.lua" "neovim.lua"
    ;;
  *)
    echo "Couldn't detect your Neovim setup at: $NVIM_CONFIG"
    echo "You can manually symlink one of:"
    echo "  $THEME_DIR/neovim/lazyvim.lua"
    echo "  $THEME_DIR/neovim/pack.lua"
    ;;
esac
