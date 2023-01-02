#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

echo "Adding repositories"

# Add repositories
# - Cava repository
sudo add-apt-repository ppa:hsheth2/ppa -y
# - Git
sudo add-apt-repository ppa:git-core/ppa -y

# Update Ubuntu
sudo apt update
sudo apt full-upgrade -y

# Install standard repository applications

echo "Installing Debian packages"
source ./util.sh

deb_install tmux
deb_install libevent-dev
deb_install libncurses5-dev
deb_install libncursesw5-dev
deb_install git
deb_install curl
deb_install file
deb_install figlet
deb_install lolcat
deb_install rar
deb_install unrar
deb_install cava
deb_install cmus
deb_install fzf
deb_install fd-find
deb_install xclip
deb_install sad
deb_install ffmpeg
deb_install stow
deb_install miller

echo "Debian packages installed. Installing programs..."

# Run all scripts in programs/
for f in programs/*.sh
do 
  echo "Running $f"
  bash "$f" -H
done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# Reload so all applications are available
source ~/.bashrc

# Show confirmation message
figlet "Systems are go." | lolcat
