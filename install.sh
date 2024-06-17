#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

# Update EndeavourOS
yay -Syu --noconfirm

# Install standard repository applications

echo "Installing AUR packages"
source ./util.sh

_install tmux
_install libevent
_install ncurses
_install git
_install curl
_install flameshot
_install file
_install figlet
_install lolcat
_install rar
_install unrar
_install cava
_install cmus
_install fzf
_install fd
_install xclip
_install sad
_install ffmpeg
_install stow
_install miller
_install snapd
_install neovim
_install zsh

echo "AUR packages installed. Installing programs..."

# Run all scripts in programs/
for f in programs/*.sh
do
  echo "Running $f"
  bash "$f" -H
done

# Get all upgrades
yay -Syu --noconfirm
yay -Rns $(yay -Qdtq) --noconfirm

# Reload so all applications are available
source ~/.bashrc

# Set zsh as the default shell
sudo chsh -s $(which zsh)

# Show confirmation message
figlet "Systems are go." | lolcat
