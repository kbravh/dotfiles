#!/bin/bash

source ../util.sh

echo "🐍 Installing Python"
install python3-venv
install python3-pip

echo "Installing pip packages"
pip3 install pynvim
