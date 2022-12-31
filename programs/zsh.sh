#!/bin/bash

source ./util.sh

deb_install zsh

# Set zsh as the default shell
sudo chsh -s $(which zsh)
