#!/bin/bash
source ./util.sh

echo "🐍 Installing Python"
deb_install python3-venv
deb_install python3-pip

echo "Installing pip packages"
pip3 install pynvim
