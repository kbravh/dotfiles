#!/bin/bash

source ../util.sh

install bat

# fix misnaming of bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
