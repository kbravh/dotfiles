#!/bin/bash

# Remove dir_colors if it already exists
rm -f ~/.dir_colors

# Symlink the new dir_colors
ln -s $HOME/dotfiles/config/.dir_colors $HOME/.dir_colors
