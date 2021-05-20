#!/bin/bash

dir="/home/kbravh/dotfiles"                                      # dotfiles repo directory
olddir="/home/kbravh/dotfiles_old"                               # old dotfiles backup directory
files=".bashrc .zshrc .aliases .functions .env .inputrc .hyper.js"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
