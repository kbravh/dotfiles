#!/bin/bash

# Install Rust via rustup
curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -qy
source $HOME/.cargo/env # Load for Rust

# Install Rust packages
cargo install bottom eza ripgrep zoxide bat git-delta
