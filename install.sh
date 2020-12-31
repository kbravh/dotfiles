#!/bin/bash

echo "Installing Debian packages"
# Update Ubuntu and get standard repository programs
apt update && apt full-upgrade -y

source ./util.sh

install tmux
install libevent
install ncurses
install git
install chromium-browser
install curl
install file
install gimp
install figlet
install lolcat
install neovim
install rar
install unrar
install cava
install cmus
install fzf
install fd-find
install xclip

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
apt upgrade -y
apt autoremove -y

figlet "Systems are go." | lolcat
