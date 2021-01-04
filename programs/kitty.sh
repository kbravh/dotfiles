#!/bin/bash
source ../util.sh

install kitty

CONFIG_DIR="$XDG_CONFIG_HOME/kitty"

# Make the config directory in case it doesn't exist yet
mkdir -p $CONFIG_DIR

# Remove the initial kitty config if it exists
rm -f $CONFIG_DIR/kitty.conf

# Symlink the kitty config file
ln -s $HOME/dotfiles/config/kitty.conf $CONFIG_DIR/kitty.conf

# Symlink the color theme files
ln -s $HOME/dotfiles/config/nord.conf $CONFIG_DIR/nord.conf
