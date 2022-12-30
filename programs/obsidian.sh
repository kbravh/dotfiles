#!/bin/bash

echo "Downloading Obsidian..."
# Determine url of latest Obsidian release
OBSIDIAN_URL=curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep "browser_download_url.*amd64.deb" \
| head -1 \
| cut -d : -f 2,3 \
| tr -d \" \ 
| xargs # trim whitespace

# Get just the package name e.g. obsidian_1.1.9_amd64.deb
OBSIDIAN_PACKAGE=$(echo $OBSIDIAN_URL | cut -d / -f 9)

# Download latest Obsidian release
wget --show-progress -qi $OBSIDIAN_URL

# Install Obsidian
sudo apt install "./${OBSIDIAN_PACKAGE}"

# Cleanup
rm "./${OBSIDIAN_PACKAGE}"

echo "Cloning notes..."
git clone git@github.com:kbravh/glass-notes.git $HOME/glass-notes
