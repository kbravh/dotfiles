#!/bin/bash

# fix misnaming of bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat || echo "bat already exists"
