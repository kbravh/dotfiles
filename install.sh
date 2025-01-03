#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

echo "Adding repositories"

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
deb_install curl
deb_install flameshot
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
deb_install snapd
deb_install zsh

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# Reload so all applications are available
source ~/.bashrc

chsh -s $(which zsh)

# Show confirmation message
figlet "Systems are go." | lolcat
