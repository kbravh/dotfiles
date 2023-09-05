#!/bin/bash

# Install fonts
FONTS_DIR=/Library/Fonts
mkdir $FONTS_DIR
cp -Rv ../.fonts/* $FONTS_DIR
fc-cache -f -v
