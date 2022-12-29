#!/bin/bash

source ../util.sh

install zsh

# Set zsh as the default shell
chsh -s $(which zsh)
