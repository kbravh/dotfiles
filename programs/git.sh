#!/bin/bash

CONFIG_DIR="$HOME"
      
# Make the config directory in case it doesn't exist yet
mkdir -p $CONFIG_DIR
     
# Remove the initial git config if it exists
rm -f $CONFIG_DIR/.gitconfig
     
# Symlink the kitty config file
ln -s $HOME/dotfiles/config/.gitconfig $CONFIG_DIR/.gitconfig
