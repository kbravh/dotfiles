#!/bin/bash
source ../util.sh

install neovim

CONFIG_DIR="$XDG_CONFIG_HOME/nvim"

# Make the config directory in case it doesn't exist yet
mkdir -p $CONFIG_DIR

# Remove the initial kitty config if it exists
rm $CONFIG_DIR/init.vim

# Symlink the kitty config file
ln -s ../config/init.vim $CONFIG_DIR/init.vim
