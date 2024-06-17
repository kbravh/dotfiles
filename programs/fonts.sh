#!/bin/bash

# Determine the appropriate home directory
if [ "$EUID" -ne 0 ]; then
  USER_HOME="$HOME"
else
  USER_HOME=$(eval echo ~"$SUDO_USER")
fi

# Install fonts
FONTS_DIR="$USER_HOME/.local/share/fonts"
mkdir -p "$FONTS_DIR"
cp -R ./.fonts/* "$FONTS_DIR"
fc-cache -f -v
