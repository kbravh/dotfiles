#!/bin/bash

echo "📦 Installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

source ~/.bashrc # Reload for nvm

nvm install node
nvm install-latest-npm

# Install Yarn
npm i -g yarn

# allow post scripts to run
npm config set ignore-scripts false

# Install Node packages via Yarn
yarn global add spaceship-prompt tweet-to-markdown rome gatsby-cli trash-cli carbon-now-cli neovim
