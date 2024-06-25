#!/bin/bash

echo "📦 Installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# sourcing this causes nvm to try to run, which fails because we don't install node till after
source ~/.bashrc # Reload for nvm

nvm install 20

# allow post scripts to run
npm config set ignore-scripts false

# Install npm packages
npm i -g trash-cli empty-trash-cli
