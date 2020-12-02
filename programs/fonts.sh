#!/bin/bash

# Install emoji picker
apt-add-repository ppa:eosrei/fonts
apt update
apt install fonts-twemoji-svginot

# Install fonts
FONTS_DIR=~/.local/share/fonts
mkdir $FONTS_DIR
cp -Rv ../.fonts/* $FONTS_DIR
fc-cache -f -v
