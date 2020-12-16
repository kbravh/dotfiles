# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load dotfiles
source "$HOME/.env"
source "$HOME/.functions"
source "$HOME/.aliases"
source "$HOME/.inputrc"

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

fpath=($fpath "/home/karey/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
fpath=($fpath "/home/karey/.zfunctions")
