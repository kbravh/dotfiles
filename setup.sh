#!/bin/bash

dir="~/dotfiles"                                      # dotfiles directory
olddir="~/dotfiles_old"                               # old dotfiles backup directory
files=".bashrc .zshrc .aliases .functions .env .inputrc .hyper.js kitty.conf"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

apt update
apt upgrade
# Install zsh
apt install zsh

# Set zsh as the default shell
chsh -s $(which zsh)
 echo "Zsh has been installed, please restart terminal"
