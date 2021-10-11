#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

echo "Installing Debian packages"

# Add repositories
add-apt-repository ppa:hsheth2/ppa
apt update

# Update Ubuntu and get standard repository programs
apt update && apt full-upgrade -y

source ./util.sh

install tmux
install libevent-dev
install libncurses5-dev
install libncursesw5-dev
install git
install curl
install file
#install gimp
install figlet
install lolcat
install rar
install unrar
install cava
install cmus
install fzf
install fd-find
install xclip
install sad
install ffmpeg
#install kitty
install neovim # move to neovim nightly

# Run all scripts in programs/
#for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
apt upgrade -y
apt autoremove -y

figlet "Systems are go." | lolcat
