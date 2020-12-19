#!/bin/bash

echo "📦 Installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc # Reload for nvm

nvm install node
nvm install-latest-npm

# Install Yarn
apt update && apt install --no-install-recommends yarn

# Install Node packages via Yarn
yarn global add spaceship-prompt tweet-to-markdown rome gatsby-cli trash-cli carbon-now-cli
