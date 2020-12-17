#!/bin/bash
source ../util.sh

install kitty

CONFIG_DIR="$XDG_CONFIG_HOME/kitty"

# Make the config directory in case it doesn't exist yet
mkdir -p $CONFIG_DIR

# Remove the initial kitty config if it exists
rm $CONFIG_DIR/kitty.conf

# Symlink the kitty config file
ln -s ../config/kitty.conf $CONFIG_DIR/kitty.conf
