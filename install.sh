# Install Debian packages
echo "Installing Debian packages"
apt install -y tmux libevent ncurses bat

# Fix misnaming of bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Install Node via nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
source ~/.zshrc # Reload for nvm
nvm install node

# Install Yarn
apt update && apt install --no-install-recommends yarn

# Install Node packages via Yarn
yarn global add spaceship-prompt tweet-to-markdown rome gatsby-cli

# Install Rust via rustup
curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -qy
source $HOME/.cargo/env # Load for Rust

# Install Rust packages
cargo install bottom exa ripgrep
