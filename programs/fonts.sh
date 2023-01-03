#!/bin/bash

# Install fonts
FONTS_DIR=/home/kbravh/.local/share/fonts
mkdir $FONTS_DIR
cp -Rv ./.fonts/* $FONTS_DIR
fc-cache -f -v
