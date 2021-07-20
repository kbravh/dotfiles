#!bin/bash

wget https://github.com/federico-terzi/espanso/releases/latest/download/espanso-debian-amd64.deb #download
apt install ./espanso-debian-amd64.deb # install
rm ./espanso-debian-amd64.deb # cleanup

CONFIG_DIR="$XDG_CONFIG_HOME/espanso"

# create the config directory
mkdir -p $CONFIG_DIR
# remove existing config
rm $CONFIG_DIR/default.yml
# symlink config file
ln -s ../config/espanso.yml $CONFIG_DIR/default.yml

#espanso start # requires user intervention
