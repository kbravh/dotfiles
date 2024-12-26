#!/bin/bash

# Install Rust via rustup
curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -qy
source $HOME/.cargo/env # Load for Rust

# Install Rust packages
cargo install bottom exa ripgrep zoxide bat git-delta alacritty

# fix misnaming of bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat || echo "bat already exists"
