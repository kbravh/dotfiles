#!/bin/bash

# fix misnaming of bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

CONFIG_DIR="$XDG_CONFIG_HOME/bat/"

# Make the config directory in case it doesn't exist yet
mkdir -p $CONFIG_DIR
# Remove existing bat config file if it exists
rm -f "$CONFIG_DIR/bat.conf"
# Symlink the desired config file
ln -s $HOME/dotfiles/config/bat.conf $CONFIG_DIR/bat.conf
